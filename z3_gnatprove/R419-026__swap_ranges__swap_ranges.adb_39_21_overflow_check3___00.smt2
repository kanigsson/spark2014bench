(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

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

(declare-sort t 0)

(declare-fun tqtint (t) Int)

;; t'axiom
  (assert
  (forall ((i t))
  (and (<= (- 2147483648) (tqtint i)) (<= (tqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (t t) Bool)

(declare-const dummy2 t)

(declare-datatypes () ((t__ref (t__refqtmk (t__content t)))))
(define-fun t__ref_t__content__projection ((a t__ref)) t (t__content a))

(define-fun to_rep1 ((x t)) Int (tqtint x))

(declare-fun of_rep1 (Int) t)

;; inversion_axiom
  (assert
  (forall ((x t)) (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x t)) (! (in_range3 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int t))))))
(declare-fun slide ((Array Int t) Int Int) (Array Int t))

;; slide_eq
  (assert
  (forall ((a (Array Int t)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int t)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int t)) (a__first Int) (a__last Int)
  (b (Array Int t)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int t)) (b (Array Int t)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const a__first integer)

(declare-const a__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b__first integer)

(declare-const b__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun dynamic_invariant ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range3 temp___expr_159)))

(declare-sort t1 0)

(declare-fun first (t1) integer)

(declare-fun last (t1) integer)

(declare-fun mk (Int Int) t1)

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
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int t))(rt t1)))))
(define-fun to_array ((a us_t)) (Array Int t) (elts a))

(define-fun of_array ((a (Array Int t)) (f Int)
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

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes () ((t_arr__ref (t_arr__refqtmk (t_arr__content us_t)))))
(define-fun t_arr__ref_t_arr__content__projection ((a t_arr__ref)) us_t 
  (t_arr__content a))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (integer integer) Bool)

(declare-const dummy4 integer)

(declare-datatypes () ((t46b__ref (t46b__refqtmk (t46b__content integer)))))
(define-fun t46b__ref_t46b__content__projection ((a t46b__ref)) integer 
  (t46b__content a))

(declare-datatypes () ((t52b__ref (t52b__refqtmk (t52b__content us_t)))))
(define-fun t52b__ref_t52b__content__projection ((a t52b__ref)) us_t 
  (t52b__content a))

(declare-datatypes () ((t54b__ref (t54b__refqtmk (t54b__content us_t)))))
(define-fun t54b__ref_t54b__content__projection ((a t54b__ref)) us_t 
  (t54b__content a))

(declare-datatypes () ((t60b__ref (t60b__refqtmk (t60b__content us_t)))))
(define-fun t60b__ref_t60b__content__projection ((a t60b__ref)) us_t 
  (t60b__content a))

(declare-datatypes () ((t62b__ref (t62b__refqtmk (t62b__content us_t)))))
(define-fun t62b__ref_t62b__content__projection ((a t62b__ref)) us_t 
  (t62b__content a))

(declare-datatypes () ((t68b__ref (t68b__refqtmk (t68b__content us_t)))))
(define-fun t68b__ref_t68b__content__projection ((a t68b__ref)) us_t 
  (t68b__content a))

(declare-datatypes () ((t70b__ref (t70b__refqtmk (t70b__content us_t)))))
(define-fun t70b__ref_t70b__content__projection ((a t70b__ref)) us_t 
  (t70b__content a))

(declare-datatypes () ((t76b__ref (t76b__refqtmk (t76b__content us_t)))))
(define-fun t76b__ref_t76b__content__projection ((a t76b__ref)) us_t 
  (t76b__content a))

(declare-datatypes () ((t78b__ref (t78b__refqtmk (t78b__content us_t)))))
(define-fun t78b__ref_t78b__content__projection ((a t78b__ref)) us_t 
  (t78b__content a))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant3 ((temp___expr_166 us_t)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (not (= temp___skip_constant_163 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_166)
                                     (last1 temp___expr_166))))

(declare-const a (Array Int t))

(declare-const b (Array Int t))

(declare-const temp Int)

(declare-const b1 (Array Int t))

;; H
  (assert (= b1 b))

(declare-const a1 (Array Int t))

;; H
  (assert (= a1 a))

;; Assume
  (assert (dynamic_property 1 2147483647 (to_rep a__first) (to_rep a__last)))

;; Assume
  (assert (dynamic_property 1 2147483647 (to_rep b__first) (to_rep b__last)))

;; Assume
  (assert
  (= (length (to_rep a__first) (to_rep a__last)) (length (to_rep b__first)
                                                 (to_rep b__last))))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant temp false false true true))

(declare-const o Int)

;; Ensures
  (assert (= (to_rep a__last) o))

(declare-const o1 Int)

;; Ensures
  (assert (= (to_rep a__first) o1))

(define-fun o2 () Int (length o1 o))

;; Ensures
  (assert (in_range1 o2))

(define-fun temp___321 () Int (- o2 1))

(declare-const j Int)

;; H
  (assert (= j 0))

;; H
  (assert
  (= (and (ite (<= 0 j) true false) (ite (<= j temp___321) true false)) true))

(declare-const temp___loop_entry_391 (Array Int t))

;; H
  (assert (= temp___loop_entry_391 b))

(declare-const temp___loop_entry_373 (Array Int t))

;; H
  (assert (= temp___loop_entry_373 a))

(declare-const temp___loop_entry_355 (Array Int t))

;; H
  (assert (= temp___loop_entry_355 b))

(declare-const temp___loop_entry_337 (Array Int t))

;; H
  (assert (= temp___loop_entry_337 a))

(declare-const o3 Int)

;; Ensures
  (assert (= (to_rep a__first) o3))

(define-fun o4 () Int (+ o3 j))

;; Ensures
  (assert (in_range1 o4))

;; Assert
  (assert (and (<= (to_rep a__first) o4) (<= o4 (to_rep a__last))))

(declare-const o5 Int)

;; Ensures
  (assert (= (to_rep1 (select a o4)) o5))

(declare-const temp1 Int)

;; H
  (assert (= temp1 o5))

(declare-const o6 Int)

;; Ensures
  (assert (= (to_rep b__first) o6))

(define-fun o7 () Int (+ o6 j))

;; Ensures
  (assert (in_range1 o7))

;; Assert
  (assert (and (<= (to_rep b__first) o7) (<= o7 (to_rep b__last))))

(declare-const o8 Int)

;; Ensures
  (assert (= (to_rep1 (select b o7)) o8))

(declare-const o9 t)

;; Ensures
  (assert (= (to_rep1 o9) o8))

(declare-const o10 Int)

;; Ensures
  (assert (= (to_rep a__first) o10))

(define-fun o11 () Int (+ o10 j))

;; Ensures
  (assert (in_range1 o11))

;; Assert
  (assert (and (<= (to_rep a__first) o11) (<= o11 (to_rep a__last))))

(declare-const a2 (Array Int t))

;; H
  (assert (= a2 (store a o11 o9)))

(declare-const o12 t)

;; Ensures
  (assert (= (to_rep1 o12) temp1))

(declare-const o13 Int)

;; Ensures
  (assert (= (to_rep b__first) o13))

(define-fun o14 () Int (+ o13 j))

(assert
;; defqtvc
 ;; File "swap_ranges.ads", line 10, characters 0-0
  (not (in_range1 o14)))
(check-sat)
