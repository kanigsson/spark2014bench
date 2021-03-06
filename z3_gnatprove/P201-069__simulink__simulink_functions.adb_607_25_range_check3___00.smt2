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
(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort float__ 0)

(declare-fun user_eq (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Float32)

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

(declare-fun sqrt2 (Float32) Float32)

(declare-fun sqrt__function_guard (Float32 Float32) Bool)

;; sqrt__post_axiom
  (assert
  (forall ((x Float32))
  (! (=>
     (and (dynamic_invariant x true true true true)
     (fp.leq (fp #b0 #b00000000 #b00000000000000000000000) x))
     (let ((result (sqrt2 x)))
     (and
     (and
     (and
     (and (fp.leq (fp #b0 #b00000000 #b00000000000000000000000) result)
     (=> (fp.eq x (fp #b0 #b00000000 #b00000000000000000000000))
     (fp.eq result (fp #b0 #b00000000 #b00000000000000000000000))))
     (=> (fp.eq x (fp #b0 #b01111111 #b00000000000000000000000))
     (fp.eq result (fp #b0 #b01111111 #b00000000000000000000000))))
     (=> (fp.leq (fp #b0 #b00000000 #b00000000000000000000001) x)
     (fp.lt (fp #b0 #b00000000 #b00000000000000000000000) result)))
     (dynamic_invariant result true false true true)))) :pattern ((sqrt2 x)) )))

(declare-sort integer_8 0)

(declare-fun integer_8qtint (integer_8) Int)

;; integer_8'axiom
  (assert
  (forall ((i1 integer_8))
  (and (<= (- 128) (integer_8qtint i1)) (<= (integer_8qtint i1) 127))))

(define-fun in_range ((x Int)) Bool (and (<= (- 128) x) (<= x 127)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (integer_8 integer_8) Bool)

(declare-const dummy1 integer_8)

(declare-datatypes ()
((integer_8__ref (integer_8__refqtmk (integer_8__content integer_8)))))
(define-fun integer_8__ref_integer_8__content__2__projection ((a integer_8__ref)) integer_8 
  (integer_8__content a))

(define-fun dynamic_invariant1 ((temp___expr_335 Int)
  (temp___is_init_331 Bool) (temp___skip_constant_332 Bool)
  (temp___do_toplevel_333 Bool)
  (temp___do_typ_inv_334 Bool)) Bool (=>
                                     (or (= temp___is_init_331 true)
                                     (<= (- 128) 127)) (in_range
                                     temp___expr_335)))

;; Assume
  (assert (dynamic_invariant1 i true false true true))

(define-fun o () Float32 (of_int RNE i))

(define-fun o1 () Float32 (sqrt2 o))

;; H
  (assert (dynamic_invariant o1 true false true true))

;; H
  (assert (fp.leq (fp #b0 #b00000000 #b00000000000000000000000) o1))

;; H
  (assert
  (=> (fp.eq o (fp #b0 #b00000000 #b00000000000000000000000))
  (fp.eq o1 (fp #b0 #b00000000 #b00000000000000000000000))))

;; H
  (assert
  (=> (fp.eq o (fp #b0 #b01111111 #b00000000000000000000000))
  (fp.eq o1 (fp #b0 #b01111111 #b00000000000000000000000))))

;; H
  (assert
  (=> (fp.leq (fp #b0 #b00000000 #b00000000000000000000001) o)
  (fp.lt (fp #b0 #b00000000 #b00000000000000000000000) o1)))

(assert
;; defqtvc
 ;; File "simulink_functions.ads", line 102, characters 0-0
  (not (in_range
  (ite (= ((_ extract 128 128) ((_ fp.to_sbv 129) RNA o1)) #b0) (bv2int ((_ fp.to_sbv 129) RNA 
  o1)) (- (bv2int ((_ fp.to_sbv 129) RNA o1)) (bv2int (bvshl (_ bv1 130) (_ bv129 130))))))))
(check-sat)

(exit)
