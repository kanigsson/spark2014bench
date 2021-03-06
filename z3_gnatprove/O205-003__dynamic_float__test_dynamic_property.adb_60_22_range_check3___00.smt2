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
(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort float__ 0)

(declare-fun user_eq (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float32)

(declare-const dummy float__)

(declare-datatypes ()
((float____ref (float____refqtmk (float____content float__)))))
(define-fun float____ref_float____content__projection ((a float____ref)) float__ 
  (float____content a))

(define-fun dynamic_invariant ((temp___expr_60 Float32)
  (temp___is_init_56 Bool) (temp___skip_constant_57 Bool)
  (temp___do_toplevel_58 Bool)
  (temp___do_typ_inv_59 Bool)) Bool (=>
                                    (or (= temp___is_init_56 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                    (fp.isFinite32 temp___expr_60)))

(declare-const d Float32)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const c Float32)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-fun to_rep (float__) Float32)

(declare-fun of_rep (Float32) float__)

;; inversion_axiom
  (assert
  (forall ((x float__)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x float__))
  (! (fp.isFinite32 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Float32))
  (! (=> (fp.isFinite32 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                                (of_rep x))) )))

(declare-const last Float32)

(define-fun dynamic_property ((first_int Float32) (last_int Float32)
  (x Float32)) Bool (and (fp.isFinite32 x)
                    (and (fp.leq first_int x) (fp.leq x last_int))))

(declare-fun eq (Float32 Float32) Bool)

(declare-fun is_finite (Float32) Bool)

(declare-fun user_eq1 (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Float32)

(declare-const dummy1 float__)

(declare-datatypes ()
((dynamic_float__ref
 (dynamic_float__refqtmk (dynamic_float__content float__)))))
(define-fun dynamic_float__ref_dynamic_float__content__projection ((a dynamic_float__ref)) float__ 
  (dynamic_float__content a))

(define-fun dynamic_invariant1 ((temp___expr_173 Float32)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (=>
                                     (or (= temp___is_init_169 true)
                                     (fp.leq (fp #b0 #b00000000 #b00000000000000000000000) 
                                     last)) (dynamic_property
                                     (fp #b0 #b00000000 #b00000000000000000000000)
                                     last temp___expr_173)))

;; last__def_axiom
  (assert (= last c))

(declare-fun dyn_return (Float32) Float32)

(declare-fun dyn_return__function_guard (Float32 Float32) Bool)

(declare-const last1 Float32)

(define-fun dynamic_property1 ((first_int Float32) (last_int Float32)
  (x Float32)) Bool (and (fp.isFinite32 x)
                    (and (fp.leq first_int x) (fp.leq x last_int))))

(declare-fun eq1 (Float32 Float32) Bool)

(declare-fun is_finite1 (Float32) Bool)

(declare-fun user_eq2 (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE3 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Float32)

(declare-const dummy2 float__)

(declare-datatypes ()
((pos_dynamic_float__ref
 (pos_dynamic_float__refqtmk (pos_dynamic_float__content float__)))))
(define-fun pos_dynamic_float__ref_pos_dynamic_float__content__projection ((a pos_dynamic_float__ref)) float__ 
  (pos_dynamic_float__content a))

(define-fun dynamic_invariant2 ((temp___expr_166 Float32)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (fp.leq (fp #b0 #b01111111 #b00000000000000000000000) 
                                     last1)) (dynamic_property1
                                     (fp #b0 #b01111111 #b00000000000000000000000)
                                     last1 temp___expr_166)))

;; last__def_axiom
  (assert (= last1 c))

;; dyn_return__post_axiom
  (assert
  (forall ((x Float32))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (dyn_return x)))
     (=> (dyn_return__function_guard result x) (dynamic_invariant2 result
     true false true true)))) :pattern ((dyn_return x)) )))

(declare-sort pos_static_float 0)

(define-fun in_range1 ((x Float32)) Bool (and (fp.isFinite32 x)
                                         (and
                                         (fp.leq (fp #b0 #b01111111 #b00000000000000000000000) x)
                                         (fp.leq x (fp #b0 #b10000101 #b10010000000000000000000)))))

(declare-fun user_eq3 (pos_static_float pos_static_float) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE4 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Float32)

(declare-const dummy3 pos_static_float)

(declare-datatypes ()
((pos_static_float__ref
 (pos_static_float__refqtmk (pos_static_float__content pos_static_float)))))
(define-fun pos_static_float__ref_pos_static_float__content__projection ((a pos_static_float__ref)) pos_static_float 
  (pos_static_float__content a))

(define-fun dynamic_invariant3 ((temp___expr_159 Float32)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (fp.leq (fp #b0 #b01111111 #b00000000000000000000000) (fp #b0 #b10000101 #b10010000000000000000000)))
                                     (in_range1 temp___expr_159)))

;; c__def_axiom
  (assert (= c d))

(declare-const y Float32)

;; Assume
  (assert (dynamic_invariant d true false true true))

;; Assume
  (assert
  (and (fp.leq (fp #b0 #b01111111 #b00000000000000000000000) d)
  (fp.leq d (fp #b0 #b10000101 #b10010000000000000000000))))

(define-fun o () Float32 d)

;; Ensures
  (assert (fp.isFinite32 o))

;; Assume
  (assert (= o c))

;; Assume
  (assert (dynamic_invariant3 c true false true true))

(define-fun o1 () Float32 c)

(define-fun o2 () Float32 last1)

(define-fun o3 () Float32 (fp #b0 #b01111111 #b00000000000000000000000))

;; Ensures
  (assert (dynamic_property1 o3 o2 o1))

(declare-const x Float32)

;; H
  (assert (= x o1))

;; Assume
  (assert (dynamic_invariant2 x true false true true))

;; Assume
  (assert (dynamic_invariant1 y true false true true))

(define-fun o4 () Float32 (dyn_return
                          (fp #b0 #b10000011 #b11100000000000000000000)))

;; H
  (assert (dyn_return__function_guard o4
  (fp #b0 #b10000011 #b11100000000000000000000)))

;; H
  (assert (dynamic_invariant2 o4 true false true true))

(declare-const x1 Float32)

;; H
  (assert (= x1 o4))

;; Assert
  (assert (fp.leq x1 c))

;; H
  (assert (dyn_return__function_guard
  (dyn_return (fp #b0 #b10000100 #b01000000000000000000000))
  (fp #b0 #b10000100 #b01000000000000000000000)))

;; Assert
  (assert
  (fp.leq (dyn_return (fp #b0 #b10000100 #b01000000000000000000000)) 
  c))

(declare-const x2 Float32)

;; Ensures
  (assert (dynamic_invariant2 x2 true true true true))

;; Assert
  (assert (fp.leq x2 c))

(declare-const spark__branch Bool)

;; H
  (assert
  (= spark__branch (ite (fp.leq (fp #b0 #b01111111 #b00000000000000000000000) 
                   y) true false)))

;; H
  (assert
  (or (not (= spark__branch true))
  (and (dynamic_property1 (fp #b0 #b01111111 #b00000000000000000000000) 
  last1 y)
  (exists ((test_dynamic_property__dyn_param__x Float32))
  (and (dynamic_invariant2 test_dynamic_property__dyn_param__x true true true
  true)
  (and (dynamic_property (fp #b0 #b00000000 #b00000000000000000000000) 
  last test_dynamic_property__dyn_param__x)
  (exists ((y1 Float32))
  (and (= y1 test_dynamic_property__dyn_param__x) (fp.leq y1 c)))))))))

(define-fun o5 () Float32 last)

(define-fun o6 () Float32 (fp #b0 #b00000000 #b00000000000000000000000))

;; Ensures
  (assert (dynamic_property o6 o5 x2))

(declare-const test_dynamic_property__nested__dyn_param__x Float32)

;; H
  (assert
  (fp.leq (fp #b0 #b01111111 #b00000000000000000000000) test_dynamic_property__nested__dyn_param__x))

;; H
  (assert (dynamic_invariant1 test_dynamic_property__nested__dyn_param__x
  true true true true))

(define-fun o7 () Float32 last1)

(define-fun o8 () Float32 (fp #b0 #b01111111 #b00000000000000000000000))

(assert
;; defqtvc
 ;; File "test_dynamic_property.adb", line 1, characters 0-0
  (not (dynamic_property1 o8 o7
  test_dynamic_property__nested__dyn_param__x)))
(check-sat)

(exit)
