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

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int Bool))))))
(declare-fun slide ((Array Int Bool) Int Int) (Array Int Bool))

;; slide_eq
  (assert
  (forall ((a (Array Int Bool)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int Bool)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int Bool)) (a__first Int) (a__last Int)
  (b (Array Int Bool)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (ite (select a temp___idx_154) 1 0) (ite (select b (+ (- b__first a__first) temp___idx_154)) 1 0)))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int Bool)) (b (Array Int Bool)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (ite (select a temp___idx_154) 1 0) (ite (select b (+ (- b__first a__first) temp___idx_154)) 1 0)))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 1 (indexqtint i)) (<= (indexqtint i) 10))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (index index) Bool)

(declare-const dummy index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(declare-fun concat1 ((Array Int Bool) Int Int (Array Int Bool) Int
  Int) (Array Int Bool))

;; concat_def
  (assert
  (forall ((a (Array Int Bool)) (b (Array Int Bool)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (forall ((i Int))
  (! (and
     (=> (and (<= a_first i) (<= i a_last))
     (= (select (concat1 a a_first a_last b b_first b_last) i) (select a i)))
     (=> (< a_last i)
     (= (select (concat1 a a_first a_last b b_first b_last) i) (select b (+ (- i a_last) (- b_first 1)))))) :pattern ((select 
  (concat1 a a_first a_last b b_first b_last) i)) )))))

(declare-fun concat_singleton_left (Bool Int (Array Int Bool) Int
  Int) (Array Int Bool))

;; concat_singleton_left_def
  (assert
  (forall ((a Bool))
  (forall ((b (Array Int Bool)))
  (forall ((a_first Int) (b_first Int) (b_last Int))
  (! (and
     (= (select (concat_singleton_left a a_first b b_first b_last) a_first) a)
     (forall ((i Int))
     (! (=> (< a_first i)
        (= (select (concat_singleton_left a a_first b b_first b_last) i) (select b (+ (- i a_first) (- b_first 1))))) :pattern ((select 
     (concat_singleton_left a a_first b b_first b_last) i)) ))) :pattern (
  (concat_singleton_left a a_first b b_first b_last)) )))))

(declare-fun concat_singleton_right ((Array Int Bool) Int Int
  Bool) (Array Int Bool))

;; concat_singleton_right_def
  (assert
  (forall ((a (Array Int Bool)))
  (forall ((b Bool))
  (forall ((a_first Int) (a_last Int))
  (! (and
     (= (select (concat_singleton_right a a_first a_last b) (+ a_last 1)) b)
     (forall ((i Int))
     (! (=> (and (<= a_first i) (<= i a_last))
        (= (select (concat_singleton_right a a_first a_last b) i) (select a i))) :pattern ((select 
     (concat_singleton_right a a_first a_last b) i)) :pattern ((select a i)) ))) :pattern (
  (concat_singleton_right a a_first a_last b)) )))))

(declare-fun concat_singletons (Bool Int Bool) (Array Int Bool))

;; concat_singletons_def
  (assert
  (forall ((a Bool) (b Bool))
  (forall ((a_first Int))
  (! (and (= (select (concat_singletons a a_first b) a_first) a)
     (= (select (concat_singletons a a_first b) (+ a_first 1)) b)) :pattern (
  (concat_singletons a a_first b)) ))))

(declare-fun singleton1 (Bool Int) (Array Int Bool))

;; singleton_def
  (assert
  (forall ((v Bool))
  (forall ((i Int))
  (! (= (select (singleton1 v i) i) v) :pattern ((select (singleton1 v i) i)) ))))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int Bool))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int Bool) (elts a))

(define-fun of_array ((a (Array Int Bool)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq2 (us_t us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes ((ttB__ref 0))
(((ttB__refqtmk (ttB__content us_t)))))
(define-fun ttB__ref_ttB__content__projection ((a ttB__ref)) us_t (ttB__content
                                                                  a))

(declare-sort t5b 0)

(declare-fun t5bqtint (t5b) Int)

;; t5b'axiom
  (assert (forall ((i t5b)) (and (<= 6 (t5bqtint i)) (<= (t5bqtint i) 10))))

(define-fun in_range3 ((x Int)) Bool (and (<= 6 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (t5b t5b) Bool)

(declare-const dummy3 t5b)

(declare-datatypes ((t5b__ref 0))
(((t5b__refqtmk (t5b__content t5b)))))
(define-fun t5b__ref_t5b__content__projection ((a t5b__ref)) t5b (t5b__content
                                                                 a))

(declare-sort t7b 0)

(declare-fun t7bqtint (t7b) Int)

;; t7b'axiom
  (assert (forall ((i t7b)) (and (<= 1 (t7bqtint i)) (<= (t7bqtint i) 5))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (t7b t7b) Bool)

(declare-const dummy4 t7b)

(declare-datatypes ((t7b__ref 0))
(((t7b__refqtmk (t7b__content t7b)))))
(define-fun t7b__ref_t7b__content__projection ((a t7b__ref)) t7b (t7b__content
                                                                 a))

(declare-fun concat__x__aggregate_def (Bool) (Array Int Bool))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

(define-fun dynamic_invariant1 ((temp___expr_180 Int)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (=>
                                     (or (= temp___is_init_176 true)
                                     (<= 1 10)) (in_range1 temp___expr_180)))

;; def_axiom
  (assert
  (forall ((temp___194 Bool))
  (forall ((temp___195 Int))
  (= (select (concat__x__aggregate_def temp___194) temp___195) temp___194))))

(assert
;; defqtvc
 ;; File "concat.adb", line 1, characters 0-0
  (not
  (forall ((x (Array Int Bool)))
  (=> (= x (concat__x__aggregate_def (distinct 1 0)))
  (=> (=> (<= 1 5) (and (and (<= 1 1) (<= 1 10)) (and (<= 1 5) (<= 5 10))))
  (=>
  (=> (<= 6 10) (and (and (<= 1 6) (<= 6 10)) (and (<= 1 10) (<= 10 10))))
  (let ((o (- (+ 1 (+ (length 6 10) (length 1 5))) 1)))
  (=> (in_range1 o)
  (let ((temp___202 (of_array (slide (concat1 x 6 10 x 1 5) 6 1) 1 o)))
  (=> (<= (first1 temp___202) (last1 temp___202)) (<= 1 10)))))))))))
(check-sat)
(exit)
