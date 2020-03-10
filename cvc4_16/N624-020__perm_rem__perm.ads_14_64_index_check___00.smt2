(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 1 (indexqtint i)) (<= (indexqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (index index) Bool)

(declare-const dummy2 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int natural))))))
(declare-fun slide ((Array Int natural) Int Int) (Array Int natural))

;; slide_eq
  (assert
  (forall ((a (Array Int natural)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int natural)) (b (Array Int natural)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int natural))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int natural) (elts a))

(define-fun of_array ((a (Array Int natural)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                   (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((nat_array__ref 0))
(((nat_array__refqtmk (nat_array__content us_t)))))
(define-fun nat_array__ref_nat_array__content__projection ((a nat_array__ref)) us_t 
  (nat_array__content a))

(declare-fun invariant__ (us_t) Bool)

(declare-fun invariant____function_guard (Bool us_t) Bool)

(define-fun dynamic_invariant ((temp___expr_222 us_t)
  (temp___is_init_218 Bool) (temp___skip_constant_219 Bool)
  (temp___do_toplevel_220 Bool)
  (temp___do_typ_inv_221 Bool)) Bool (=>
                                     (not (= temp___skip_constant_219 true))
                                     (dynamic_property 1 100
                                     (first1 temp___expr_222)
                                     (last1 temp___expr_222))))

;; invariant____post_axiom
  (assert true)

;; invariant____def_axiom
  (assert
  (forall ((a us_t))
  (! (= (= (invariant__ a) true) (and (= (first1 a) 1) (<= 0 (last1 a)))) :pattern (
  (invariant__ a)) )))

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const result____first integer)

(declare-const result____last integer)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant1 ((temp___expr_215 Int)
  (temp___is_init_211 Bool) (temp___skip_constant_212 Bool)
  (temp___do_toplevel_213 Bool)
  (temp___do_typ_inv_214 Bool)) Bool (=>
                                     (or (= temp___is_init_211 true)
                                     (<= 1 100)) (in_range3 temp___expr_215)))

(declare-fun concat1 ((Array Int natural) Int Int (Array Int natural) Int
  Int) (Array Int natural))

;; concat_def
  (assert
  (forall ((a1 (Array Int natural)) (b (Array Int natural)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (forall ((i1 Int))
  (! (and
     (=> (and (<= a_first i1) (<= i1 a_last))
     (= (select (concat1 a1 a_first a_last b b_first b_last) i1) (select a1 i1)))
     (=> (< a_last i1)
     (= (select (concat1 a1 a_first a_last b b_first b_last) i1) (select b (+ (- i1 a_last) (- b_first 1)))))) :pattern ((select 
  (concat1 a1 a_first a_last b b_first b_last) i1)) )))))

(declare-fun concat_singleton_left (natural Int (Array Int natural) Int
  Int) (Array Int natural))

;; concat_singleton_left_def
  (assert
  (forall ((a1 natural))
  (forall ((b (Array Int natural)))
  (forall ((a_first Int) (b_first Int) (b_last Int))
  (! (and
     (= (select (concat_singleton_left a1 a_first b b_first b_last) a_first) a1)
     (forall ((i1 Int))
     (! (=> (< a_first i1)
        (= (select (concat_singleton_left a1 a_first b b_first b_last) i1) (select b (+ (- i1 a_first) (- b_first 1))))) :pattern ((select 
     (concat_singleton_left a1 a_first b b_first b_last) i1)) ))) :pattern (
  (concat_singleton_left a1 a_first b b_first b_last)) )))))

(declare-fun concat_singleton_right ((Array Int natural) Int Int
  natural) (Array Int natural))

;; concat_singleton_right_def
  (assert
  (forall ((a1 (Array Int natural)))
  (forall ((b natural))
  (forall ((a_first Int) (a_last Int))
  (! (and
     (= (select (concat_singleton_right a1 a_first a_last b) (+ a_last 1)) b)
     (forall ((i1 Int))
     (! (=> (and (<= a_first i1) (<= i1 a_last))
        (= (select (concat_singleton_right a1 a_first a_last b) i1) (select a1 i1))) :pattern ((select 
     (concat_singleton_right a1 a_first a_last b) i1)) :pattern ((select a1 i1)) ))) :pattern (
  (concat_singleton_right a1 a_first a_last b)) )))))

(declare-fun concat_singletons (natural Int natural) (Array Int natural))

;; concat_singletons_def
  (assert
  (forall ((a1 natural) (b natural))
  (forall ((a_first Int))
  (! (and (= (select (concat_singletons a1 a_first b) a_first) a1)
     (= (select (concat_singletons a1 a_first b) (+ a_first 1)) b)) :pattern (
  (concat_singletons a1 a_first b)) ))))

(declare-fun singleton1 (natural Int) (Array Int natural))

;; singleton_def
  (assert
  (forall ((v natural))
  (forall ((i1 Int))
  (! (= (select (singleton1 v i1) i1) v) :pattern ((select (singleton1 v i1) i1)) ))))

(declare-datatypes ((result_ty__ref 0))
(((result_ty__refqtmk (result_ty__content us_t)))))
(define-fun result_ty__ref_result_ty__content__projection ((a1 result_ty__ref)) us_t 
  (result_ty__content a1))

(declare-datatypes ((t3b__ref 0))
(((t3b__refqtmk (t3b__content us_t)))))
(define-fun t3b__ref_t3b__content__projection ((a1 t3b__ref)) us_t (t3b__content
                                                                   a1))

(declare-datatypes ((t5b__ref 0))
(((t5b__refqtmk (t5b__content us_t)))))
(define-fun t5b__ref_t5b__content__projection ((a1 t5b__ref)) us_t (t5b__content
                                                                   a1))

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant4 ((temp___expr_363 us_t)
  (temp___is_init_359 Bool) (temp___skip_constant_360 Bool)
  (temp___do_toplevel_361 Bool)
  (temp___do_typ_inv_362 Bool)) Bool (=>
                                     (not (= temp___skip_constant_360 true))
                                     (and (dynamic_property 1 (- (last1 a) 1)
                                     (first1 temp___expr_363)
                                     (last1 temp___expr_363))
                                     (and (= (first1 temp___expr_363) 1)
                                     (= (last1 temp___expr_363) (- (last1 a) 1))))))

(define-fun default_initial_assumption ((temp___expr_365 us_t)
  (temp___skip_top_level_366 Bool)) Bool (and (= (first1 temp___expr_365) 1)
                                         (= (last1 temp___expr_365) (- 
                                         (last1 a) 1))))

(assert
;; defqtvc
 ;; File "perm.ads", line 9, characters 0-0
  (not
  (forall ((temp___856 us_t))
  (=> (dynamic_invariant a true false true true)
  (=> (dynamic_invariant1 i true false true true)
  (=> (invariant____function_guard (invariant__ a) a)
  (=> (= (invariant__ a) true)
  (=> (<= (first1 a) i)
  (=> (<= i (last1 a))
  (=>
  (let ((temp___853 (last1 a)))
  (let ((temp___852 (+ i 1)))
  (and
  (=> (<= temp___852 temp___853)
  (and (and (<= (first1 a) temp___852) (<= temp___852 (last1 a)))
  (and (<= (first1 a) temp___853) (<= temp___853 (last1 a)))))
  (let ((temp___855 (of_array (to_array a) temp___852 temp___853)))
  (let ((temp___851 (- i 1)))
  (and
  (=> (<= 1 temp___851)
  (and (and (<= (first1 a) 1) (<= 1 (last1 a)))
  (and (<= (first1 a) temp___851) (<= temp___851 (last1 a)))))
  (let ((temp___854 (of_array (to_array a) 1 temp___851)))
  (ite (= (length1 temp___854) 0)
  (= temp___856 (of_array (to_array temp___855) (first1 temp___855)
                (last1 temp___855)))
  (let ((o (- (+ (first1 temp___854) (+ (length (first1 temp___854)
                                        (last1 temp___854)) (length
                                                            (first1
                                                            temp___855)
                                                            (last1
                                                            temp___855)))) 1)))
  (and (in_range3 o)
  (= temp___856 (of_array
                (concat1 (to_array temp___854) (first1 temp___854)
                (last1 temp___854) (to_array temp___855) (first1 temp___855)
                (last1 temp___855)) (first1 temp___854) o))))))))))))
  (=>
  (ite (<= (first1 temp___856) (last1 temp___856))
  (and (<= 1 (- (last1 a) 1))
  (= (- (last1 temp___856) (first1 temp___856)) (- (- (last1 a) 1) 1)))
  (< (- (last1 a) 1) 1))
  (let ((perm__remove__result__assume (of_array
                                      (slide (to_array temp___856)
                                      (first1 temp___856) 1) 1
                                      (- (last1 a) 1))))
  (forall ((result__ (Array Int natural)))
  (=> (= result__ (to_array perm__remove__result__assume))
  (=> (= (to_rep1 result____first) (first1 perm__remove__result__assume))
  (=> (= (to_rep1 result____last) (last1 perm__remove__result__assume))
  (=>
  (and (dynamic_property 1 (- (last1 a) 1) (to_rep1 result____first)
  (to_rep1 result____last))
  (and (= (to_rep1 result____first) 1)
  (= (to_rep1 result____last) (- (last1 a) 1))))
  (forall ((o Int))
  (=> (= (to_rep1 result____last) o)
  (forall ((o1 Int))
  (=> (= (to_rep1 result____first) o1)
  (forall ((perm__remove__result us_t))
  (=> (= perm__remove__result (of_array result__ o1 o))
  (forall ((o2 Bool))
  (=>
  (exists ((o3 Bool))
  (and
  (let ((o4 (invariant__ perm__remove__result)))
  (and
  (and (invariant____function_guard o4 perm__remove__result)
  (= (= o4 true)
  (and (= (first1 perm__remove__result) 1)
  (<= 0 (last1 perm__remove__result)))))
  (ite (= o4 true)
  (let ((o5 (- (last1 a) 1)))
  (and (in_range1 o5)
  (= o3 (ite (= (last1 perm__remove__result) o5) true false)))) (= o3 false))))
  (ite (= o3 true)
  (= o2 (ite (forall ((k Int))
             (=> (and (<= 1 k) (<= k (- i 1)))
             (= (to_rep (select (to_array a) k)) (to_rep
                                                 (select (to_array
                                                         perm__remove__result) k)))))
        true false))
  (= o2 false))))
  (=> (= o2 true)
  (forall ((usf Int))
  (=>
  (= (and (ite (<= (+ i 1) usf) true false) (ite (<= usf (last1 a)) true
                                            false)) true)
  (let ((o3 (- usf 1)))
  (=> (in_range1 o3) (<= o3 (last1 perm__remove__result))))))))))))))))))))))))))))))))
(check-sat)
(exit)
