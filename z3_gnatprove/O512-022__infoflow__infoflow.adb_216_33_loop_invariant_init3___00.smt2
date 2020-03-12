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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

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

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (to_rep (select a temp___idx_155)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_155)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (to_rep (select a temp___idx_155)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_155)))))))))))

(declare-const a_v1__first integer)

(declare-const a_v1__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const a_v2__first integer)

(declare-const a_v2__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

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
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
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

(declare-fun user_eq1 (us_t us_t) Bool)

(declare-const dummy1 us_t)

(declare-datatypes () ((arr__ref (arr__refqtmk (arr__content us_t)))))
(define-fun arr__ref_arr__content__projection ((a arr__ref)) us_t (arr__content
                                                                  a))

(declare-const b_v1 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const c_v1 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const b_v2 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const c_v2 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const k_1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const k_2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-const attr__ATTRIBUTE_ADDRESS12 Int)

(define-fun dynamic_invariant1 ((temp___expr_257 us_t)
  (temp___is_init_253 Bool) (temp___skip_constant_254 Bool)
  (temp___do_toplevel_255 Bool)
  (temp___do_typ_inv_256 Bool)) Bool (=>
                                     (not (= temp___skip_constant_254 true))
                                     (dynamic_property (- 2147483648)
                                     2147483647 (first1 temp___expr_257)
                                     (last1 temp___expr_257))))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes () ((t42b__ref (t42b__refqtmk (t42b__content integer)))))
(define-fun t42b__ref_t42b__content__projection ((a t42b__ref)) integer 
  (t42b__content a))

(define-fun dynamic_property2 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (integer integer) Bool)

(declare-const dummy3 integer)

(declare-datatypes () ((t49b__ref (t49b__refqtmk (t49b__content integer)))))
(define-fun t49b__ref_t49b__content__projection ((a t49b__ref)) integer 
  (t49b__content a))

(define-fun dynamic_property3 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (integer integer) Bool)

(declare-const dummy4 integer)

(declare-datatypes () ((t62b__ref (t62b__refqtmk (t62b__content integer)))))
(define-fun t62b__ref_t62b__content__projection ((a t62b__ref)) integer 
  (t62b__content a))

(define-fun dynamic_property4 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (integer integer) Bool)

(declare-const dummy5 integer)

(declare-datatypes () ((t73b__ref (t73b__refqtmk (t73b__content integer)))))
(define-fun t73b__ref_t73b__content__projection ((a t73b__ref)) integer 
  (t73b__content a))

(declare-const a_v1 (Array Int integer))

(declare-const a_v2 (Array Int integer))

;; Assume
  (assert (dynamic_property (- 2147483648) 2147483647 (to_rep a_v1__first)
  (to_rep a_v1__last)))

;; Assume
  (assert (dynamic_property (- 2147483648) 2147483647 (to_rep a_v2__first)
  (to_rep a_v2__last)))

;; Assume
  (assert (dynamic_invariant1 b_v1 true false true true))

;; Assume
  (assert (dynamic_invariant1 c_v1 true false true true))

;; Assume
  (assert (dynamic_invariant1 b_v2 true false true true))

;; Assume
  (assert (dynamic_invariant1 c_v2 true false true true))

;; Assume
  (assert (dynamic_invariant k_1 true false true true))

;; Assume
  (assert (dynamic_invariant k_2 true false true true))

;; Assume
  (assert (dynamic_invariant i true false true true))

;; Assume
  (assert
  (and
  (and
  (and
  (and
  (and
  (and
  (and
  (and
  (and
  (and
  (and (and (= (to_rep a_v1__first) 1) (= (first1 b_v1) 1))
  (= (first1 c_v1) 1)) (= (to_rep a_v1__last) (last1 b_v1)))
  (= (to_rep a_v1__last) (last1 c_v1)))
  (and (<= (first1 b_v1) k_1) (<= k_1 (last1 b_v1))))
  (= (to_rep a_v2__first) 1)) (= (first1 b_v2) 1)) (= (first1 c_v2) 1))
  (= (to_rep a_v2__last) (last1 b_v2))) (= (to_rep a_v2__last) (last1 c_v2)))
  (and (<= (first1 b_v2) k_2) (<= k_2 (last1 b_v2))))
  (= (to_rep a_v1__last) (to_rep a_v2__last))))

(define-fun usf () Bool (and (and (= k_1 k_2) (and (ite (<= (to_rep
                                                            a_v1__first) 
                                                   i) true false) (ite (<= 
                                                                  i k_1) true
                                                                  false))) (= 
  (to_rep (select (to_array b_v1) i)) (to_rep (select (to_array b_v2) i)))))

(define-fun usf1 () Bool (and (and (= k_1 k_2) (and (ite (<= (+ k_1 1) 
                                                    i) true false) (ite (<= 
                                                                   i 
                                                                   (to_rep
                                                                   a_v1__last))
                                                                   true
                                                                   false))) (= 
  (to_rep (select (to_array c_v1) (- i k_1))) (to_rep
                                              (select (to_array c_v2) (- 
                                              i k_1))))))

(declare-const a_v11 (Array Int integer))

(declare-const a_v21 (Array Int integer))

;; Ensures
  (assert
  (and
  (and
  (forall ((m Int))
  (=> (and (<= (to_rep a_v1__first) m) (<= m k_1))
  (= (to_rep (select a_v11 m)) (to_rep (select (to_array b_v1) m)))))
  (forall ((m Int))
  (=> (and (<= (+ k_1 1) m) (<= m (to_rep a_v1__last)))
  (= (to_rep (select a_v11 m)) (to_rep (select (to_array c_v1) (- m k_1)))))))
  (forall ((m Int))
  (=> (and (<= (to_rep a_v2__first) m) (<= m k_2))
  (= (to_rep (select a_v21 m)) (to_rep (select (to_array b_v2) m)))))))

(define-fun o () Int (+ k_2 1))

;; Ensures
  (assert (in_range1 o))

(declare-const temp___511 Int)

;; Ensures
  (assert (= (to_rep a_v2__last) temp___511))

(declare-const i_v2 Int)

;; H
  (assert (= i_v2 o))

;; H
  (assert
  (= (and (ite (<= o i_v2) true false) (ite (<= i_v2 temp___511) true false)) true))

(declare-const o1 Int)

;; Ensures
  (assert (= (to_rep a_v2__first) o1))

(declare-const m Int)

;; H
  (assert (<= (to_rep a_v2__first) m))

;; H
  (assert (<= m k_2))

(assert
;; defqtvc
 ;; File "infoflow.ads", line 111, characters 0-0
  (not (= (to_rep (select a_v21 m)) (to_rep (select (to_array b_v2) m)))))
(check-sat)
