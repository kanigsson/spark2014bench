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

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort small_index 0)

(declare-fun small_indexqtint (small_index) Int)

;; small_index'axiom
  (assert
  (forall ((i small_index))
  (and (<= 1 (small_indexqtint i)) (<= (small_indexqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (small_index small_index) Bool)

(declare-const dummy2 small_index)

(declare-datatypes ((small_index__ref 0))
(((small_index__refqtmk (small_index__content small_index)))))
(define-fun small_index__ref_small_index__content__projection ((a small_index__ref)) small_index 
  (small_index__content a))

(declare-sort map1 0)

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content map1)))))
(declare-fun get (map1 Int Int) integer)

(declare-fun set (map1 Int Int integer) map1)

;; Select_eq
  (assert
  (forall ((m map1))
  (forall ((i Int))
  (forall ((j Int))
  (forall ((a integer))
  (! (= (get (set m i j a) i j) a) :pattern ((set m i j a)) ))))))

;; Select_neq
  (assert
  (forall ((m map1))
  (forall ((i Int) (i2 Int))
  (forall ((j Int) (j2 Int))
  (forall ((a integer))
  (! (=> (not (and (= i i2) (= j j2)))
     (= (get (set m i j a) i2 j2) (get m i2 j2))) :pattern ((get
                                                            (set m i j a) i2
                                                            j2)) :pattern (
  (set m i j a) (get m i2 j2)) ))))))

(declare-fun slide (map1 Int Int Int Int) map1)

;; slide_def
  (assert
  (forall ((a map1))
  (forall ((new_first Int) (old_first Int))
  (forall ((new_first_2 Int) (old_first_2 Int))
  (forall ((i Int))
  (forall ((j Int))
  (! (= (get (slide a old_first new_first old_first_2 new_first_2) i j) 
  (get a (- i (- new_first old_first)) (- j (- new_first_2 old_first_2)))) :pattern (
  (get (slide a old_first new_first old_first_2 new_first_2) i j)) )))))))

(define-fun bool_eq ((a map1) (a__first Int) (a__last Int) (a__first_2 Int)
  (a__last_2 Int) (b map1) (b__first Int) (b__last Int) (b__first_2 Int)
  (b__last_2 Int)) Bool (ite (and
                             (and
                             (ite (<= a__first a__last)
                             (and (<= b__first b__last)
                             (= (- a__last a__first) (- b__last b__first)))
                             (< b__last b__first))
                             (ite (<= a__first_2 a__last_2)
                             (and (<= b__first_2 b__last_2)
                             (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
                             (< b__last_2 b__first_2)))
                             (forall ((temp___idx_170 Int)
                             (temp___idx_171 Int))
                             (=>
                             (and
                             (and (<= a__first temp___idx_170)
                             (<= temp___idx_170 a__last))
                             (and (<= a__first_2 temp___idx_171)
                             (<= temp___idx_171 a__last_2)))
                             (= (to_rep
                                (get a temp___idx_170 temp___idx_171)) 
                             (to_rep
                             (get b (+ (- b__first a__first) temp___idx_170)
                             (+ (- b__first_2 a__first_2) temp___idx_171)))))))
                        true false))

;; bool_eq_rev
  (assert
  (forall ((a map1) (b map1))
  (forall ((a__first Int) (a__last Int) (a__first_2 Int) (a__last_2 Int)
  (b__first Int) (b__last Int) (b__first_2 Int) (b__last_2 Int))
  (=>
  (= (bool_eq b b__first b__last b__first_2 b__last_2 a a__first a__last
     a__first_2 a__last_2) true)
  (and
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (ite (<= a__first_2 a__last_2)
  (and (<= b__first_2 b__last_2)
  (= (- a__last_2 a__first_2) (- b__last_2 b__first_2)))
  (< b__last_2 b__first_2)))
  (forall ((temp___idx_170 Int) (temp___idx_171 Int))
  (=>
  (and (and (<= a__first temp___idx_170) (<= temp___idx_170 a__last))
  (and (<= a__first_2 temp___idx_171) (<= temp___idx_171 a__last_2)))
  (= (to_rep (get a temp___idx_170 temp___idx_171)) (to_rep
                                                    (get b
                                                    (+ (- b__first a__first) temp___idx_170)
                                                    (+ (- b__first_2 a__first_2) temp___idx_171)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-sort t1 0)

(declare-fun first1 (t1) integer)

(declare-fun last1 (t1) integer)

(declare-fun mk1 (Int Int) t1)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first1 (mk1 f l))) f) (= (to_rep (last1 (mk1 f l))) l)))) :pattern (
  (mk1 f l)) )))

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts map1)(rt t)(rt_2 t1)))))
(define-fun to_array ((a us_t)) map1 (elts a))

(define-fun of_array ((a map1) (f Int) (l Int) (f2 Int)
  (l2 Int)) us_t (us_tqtmk a (mk f l) (mk1 f2 l2)))

(define-fun first2 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last2 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first2 a) (last2 a))
                                  (+ (- (last2 a) (first2 a)) 1) 0))

(define-fun first_2 ((a us_t)) Int (to_rep (first1 (rt_2 a))))

(define-fun last_2 ((a us_t)) Int (to_rep (last1 (rt_2 a))))

(define-fun length_2 ((a us_t)) Int (ite (<= (first_2 a) (last_2 a))
                                    (+ (- (last_2 a) (first_2 a)) 1) 0))

(define-fun dynamic_property2 ((range_first1 Int) (range_last1 Int) (f1 Int)
  (l1 Int) (range_first2 Int) (range_last2 Int) (f2 Int)
  (l2 Int)) Bool (and (dynamic_property range_first1 range_last1 f1 l1)
                 (dynamic_property1 range_first2 range_last2 f2 l2)))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (to_rep (first1 (rt_2 x)))
                 (to_rep (last1 (rt_2 x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y))) (to_rep (first1 (rt_2 y)))
                 (to_rep (last1 (rt_2 y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((small_matrix__ref 0))
(((small_matrix__refqtmk (small_matrix__content us_t)))))
(define-fun small_matrix__ref_small_matrix__content__projection ((a small_matrix__ref)) us_t 
  (small_matrix__content a))

(declare-datatypes ((array_type__ref 0))
(((array_type__refqtmk (array_type__content us_t)))))
(define-fun array_type__ref_array_type__content__7__projection ((a array_type__ref)) us_t 
  (array_type__content a))

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const j Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort index_1 0)

(declare-fun index_1qtint (index_1) Int)

;; index_1'axiom
  (assert
  (forall ((i1 index_1))
  (and (<= 1 (index_1qtint i1)) (<= (index_1qtint i1) 100))))

(define-fun in_range4 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (index_1 index_1) Bool)

(declare-const dummy4 index_1)

(declare-datatypes ((index_1__ref 0))
(((index_1__refqtmk (index_1__content index_1)))))
(define-fun index_1__ref_index_1__content__4__projection ((a1 index_1__ref)) index_1 
  (index_1__content a1))

(define-fun dynamic_invariant1 ((temp___expr_835 Int)
  (temp___is_init_831 Bool) (temp___skip_constant_832 Bool)
  (temp___do_toplevel_833 Bool)
  (temp___do_typ_inv_834 Bool)) Bool (=>
                                     (or (= temp___is_init_831 true)
                                     (<= 1 100)) (in_range4 temp___expr_835)))

(declare-sort index_2 0)

(declare-fun index_2qtint (index_2) Int)

;; index_2'axiom
  (assert
  (forall ((i1 index_2))
  (and (<= 1 (index_2qtint i1)) (<= (index_2qtint i1) 100))))

(define-fun in_range5 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 100)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (index_2 index_2) Bool)

(declare-const dummy5 index_2)

(declare-datatypes ((index_2__ref 0))
(((index_2__refqtmk (index_2__content index_2)))))
(define-fun index_2__ref_index_2__content__4__projection ((a1 index_2__ref)) index_2 
  (index_2__content a1))

(define-fun dynamic_invariant2 ((temp___expr_842 Int)
  (temp___is_init_838 Bool) (temp___skip_constant_839 Bool)
  (temp___do_toplevel_840 Bool)
  (temp___do_typ_inv_841 Bool)) Bool (=>
                                     (or (= temp___is_init_838 true)
                                     (<= 1 100)) (in_range5 temp___expr_842)))

(define-fun dynamic_invariant3 ((temp___expr_856 us_t)
  (temp___is_init_852 Bool) (temp___skip_constant_853 Bool)
  (temp___do_toplevel_854 Bool)
  (temp___do_typ_inv_855 Bool)) Bool (=>
                                     (not (= temp___skip_constant_853 true))
                                     (dynamic_property2 1 100
                                     (first2 temp___expr_856)
                                     (last2 temp___expr_856) 1 100
                                     (first_2 temp___expr_856)
                                     (last_2 temp___expr_856))))

(define-fun dynamic_invariant4 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant5 ((temp___expr_210 Int)
  (temp___is_init_206 Bool) (temp___skip_constant_207 Bool)
  (temp___do_toplevel_208 Bool)
  (temp___do_typ_inv_209 Bool)) Bool (=>
                                     (or (= temp___is_init_206 true)
                                     (<= 1 100)) (in_range3 temp___expr_210)))

(assert
;; defqtvc
 ;; File "spark-higher_order-fold.ads", line 646, characters 0-0
  (not
  (=> (dynamic_invariant3 a true false true true)
  (=> (dynamic_invariant x true false true true)
  (=> (dynamic_invariant1 i true false true true)
  (=> (dynamic_invariant2 j true false true true)
  (=> (<= (first2 a) i)
  (=> (<= i (last2 a))
  (=> (<= (first_2 a) j)
  (=> (<= j (last_2 a))
  (let ((o (- j (first_2 a)))) (=> (in_range1 o) (in_range2 o)))))))))))))
(check-sat)
(exit)
