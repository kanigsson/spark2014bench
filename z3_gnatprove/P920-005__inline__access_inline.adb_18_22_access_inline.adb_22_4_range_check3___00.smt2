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
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite32 ((x Float32)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral32 ((x Float32)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
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

(declare-fun pow2 (Int) Int)

(define-fun is_plus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float32)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float32)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

(declare-fun of_int (RoundingMode Int) Float32)

(declare-const max_int Int)

(define-fun in_int_range ((i Int)) Bool (and (<= (- max_int) i)
                                        (<= i max_int)))

(define-fun in_safe_int_range ((i Int)) Bool (and (<= (- 16777216) i)
                                             (<= i 16777216)))

(define-fun same_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isPositive y))
                    (and (fp.isNegative x) (fp.isNegative y))))

(define-fun diff_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isNegative y))
                    (and (fp.isNegative x) (fp.isPositive y))))

(define-fun product_sign ((z Float32) (x Float32)
  (y Float32)) Bool (and (=> (same_sign x y) (fp.isPositive z))
                    (=> (diff_sign x y) (fp.isNegative z))))

(define-fun sqr ((x Real)) Real (* x x))

(declare-fun sqrt1 (Real) Real)

(define-fun same_sign_real ((x Float32)
  (r Real)) Bool (or (and (fp.isPositive x) (< 0.0 r))
                 (and (fp.isNegative x) (< r 0.0))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content Float32)))))
(declare-const c_2pi_in_degrees Float32)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort t_angle_360 0)

(define-fun in_range ((x Float32)) Bool (and (fp.isFinite32 x)
                                        (and
                                        (fp.leq (fp #b0 #b00000000 #b00000000000000000000000) x)
                                        (fp.leq x (fp #b0 #b10000111 #b01101000000000000000000)))))

(declare-fun user_eq (t_angle_360 t_angle_360) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Float32)

(declare-const dummy t_angle_360)

(declare-datatypes ()
((t_angle_360__ref (t_angle_360__refqtmk (t_angle_360__content t_angle_360)))))
(define-fun t_angle_360__ref_t_angle_360__content__projection ((a t_angle_360__ref)) t_angle_360 
  (t_angle_360__content a))

(declare-fun to_rep (t_angle_360) Float32)

(declare-fun of_rep (Float32) t_angle_360)

;; inversion_axiom
  (assert
  (forall ((x t_angle_360))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x t_angle_360)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Float32))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int t_angle_360))))))
(declare-fun slide ((Array Int t_angle_360) Int Int) (Array Int t_angle_360))

;; slide_eq
  (assert
  (forall ((a (Array Int t_angle_360)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int t_angle_360)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int t_angle_360)) (a__first Int) (a__last Int)
  (b (Array Int t_angle_360)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (fp.eq (to_rep (select a temp___idx_154)) 
                           (to_rep
                           (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int t_angle_360)) (b (Array Int t_angle_360)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (fp.eq (to_rep (select a temp___idx_154)) (to_rep
                                            (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const c6b Float32)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort tt_float32B 0)

(declare-fun user_eq1 (tt_float32B tt_float32B) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float32)

(declare-const dummy1 tt_float32B)

(declare-datatypes ()
((tt_float32B__ref (tt_float32B__refqtmk (tt_float32B__content tt_float32B)))))
(define-fun tt_float32B__ref_tt_float32B__content__projection ((a tt_float32B__ref)) tt_float32B 
  (tt_float32B__content a))

(declare-sort t_float32 0)

(define-fun in_range1 ((x Float32)) Bool (and (fp.isFinite32 x)
                                         (and
                                         (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111101110)) x)
                                         (fp.leq x (fp #b0 #b11111110 #b11111111111111111101110)))))

(declare-fun user_eq2 (t_float32 t_float32) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Float32)

(declare-const dummy2 t_float32)

(declare-datatypes ()
((t_float32__ref (t_float32__refqtmk (t_float32__content t_float32)))))
(define-fun t_float32__ref_t_float32__content__projection ((a t_float32__ref)) t_float32 
  (t_float32__content a))

(define-fun dynamic_invariant ((temp___expr_180 Float32)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (=>
                                     (or (= temp___is_init_176 true)
                                     (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111101110)) (fp #b0 #b11111110 #b11111111111111111101110)))
                                     (in_range1 temp___expr_180)))

(declare-fun access_inline__angle__aggregate_def (Float32) (Array Int t_angle_360))

;; c_2pi_in_degrees__def_axiom
  (assert (= c_2pi_in_degrees (fp #b0 #b10000111 #b01101000000000000000000)))

(define-fun dynamic_invariant1 ((temp___expr_187 Float32)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=>
                                     (or (= temp___is_init_183 true)
                                     (fp.leq (fp #b0 #b00000000 #b00000000000000000000000) (fp #b0 #b10000111 #b01101000000000000000000)))
                                     (in_range temp___expr_187)))

;; def_axiom
  (assert
  (forall ((temp___208 Float32))
  (=> (dynamic_invariant1 temp___208 true true true true)
  (forall ((temp___209 Int))
  (= (to_rep
     (select (access_inline__angle__aggregate_def temp___208) temp___209)) temp___208)))))

;; Assume
  (assert (dynamic_invariant c_2pi_in_degrees true false true true))

(declare-const angle (Array Int t_angle_360))

;; H
  (assert
  (= angle (access_inline__angle__aggregate_def
           (fp #b0 #b00000000 #b00000000000000000000000))))

;; Assume
  (assert true)

(declare-const access_inline__C6b__assume Float32)

;; Ensures
  (assert (= (to_rep (select angle 3)) access_inline__C6b__assume))

;; Assume
  (assert (= access_inline__C6b__assume c6b))

;; Assume
  (assert (dynamic_invariant c6b true false true true))

(declare-const o Float32)

;; Ensures
  (assert (= (to_rep (select angle 3)) o))

(declare-const o1 Float32)

;; Ensures
  (assert (= (to_rep (select angle 3)) o1))

(define-fun o2 () Float32 (fp.sub RNE o1 o))

;; Ensures
  (assert (fp.isFinite32 o2))

(assert
;; defqtvc
 ;; File "access_inline.adb", line 1, characters 0-0
  (not (in_range1 o2)))
(check-sat)
