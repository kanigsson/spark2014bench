;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite32 ((x Float32)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral32 ((x Float32)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
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

(declare-fun pow2 (Int) Int)

(define-fun is_plus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float32)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float32)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

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

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content Float32)))))
;; max_value
  (assert
  (= (* 33554430.0 10141204801825835211973625643008.0) (fp.to_real (fp #b0 #b11111110 #b11111111111111111111111))))

(declare-fun next_representable (Float32) Float32)

(declare-fun prev_representable (Float32) Float32)

;; next_representable_def
  (assert
  (forall ((x Float32))
  (! (=> (fp.isFinite32 x) (fp.lt x (next_representable x))) :pattern (
  (next_representable x)) )))

;; prev_representable_def
  (assert
  (forall ((x Float32))
  (! (=> (fp.isFinite32 x) (fp.lt (prev_representable x) x)) :pattern (
  (prev_representable x)) )))

;; next_representable_def2
  (assert
  (forall ((x Float32) (y Float32))
  (=> (fp.lt x y) (fp.leq (next_representable x) y))))

;; prev_representable_def2
  (assert
  (forall ((x Float32) (y Float32))
  (=> (fp.lt y x) (fp.leq y (prev_representable x)))))

;; next_representable_finite
  (assert
  (forall ((x Float32))
  (! (=> (fp.isFinite32 x)
     (=> (not (fp.eq x (fp #b0 #b11111110 #b11111111111111111111111)))
     (fp.isFinite32 (next_representable x)))) :pattern ((fp.isFinite32 
  (next_representable x))) )))

;; prev_representable_finite
  (assert
  (forall ((x Float32))
  (! (=> (fp.isFinite32 x)
     (=>
     (not (fp.eq x (fp.neg (fp #b0 #b11111110 #b11111111111111111111111))))
     (fp.isFinite32 (prev_representable x)))) :pattern ((fp.isFinite32 
  (prev_representable x))) )))

(declare-sort float__ 0)

(declare-fun user_eq (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Float32)

(declare-const dummy float__)

(declare-datatypes ((float____ref 0))
(((float____refqtmk (float____content float__)))))
(define-fun float____ref_float____content__projection ((a float____ref)) float__ 
  (float____content a))

(define-fun dynamic_invariant ((temp___expr_60 Float32)
  (temp___is_init_56 Bool) (temp___skip_constant_57 Bool)
  (temp___do_toplevel_58 Bool)
  (temp___do_typ_inv_59 Bool)) Bool (=>
                                    (or (= temp___is_init_56 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                    (fp.isFinite32 temp___expr_60)))

(declare-const a Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(assert
;; defqtvc
 ;; File "succ_floats.adb", line 1, characters 0-0
  (not
  (forall ((x Float32) (x1 Float32) (x2 Float32))
  (=> (dynamic_invariant x false false true true)
  (=> (= x1 (fp #b0 #b00000000 #b00000000000000000000000))
  (=>
  (fp.lt (fp #b0 #b00000000 #b00000000000000000000000) (next_representable
                                                       x1))
  (=>
  (fp.lt (next_representable x1) (fp #b0 #b01111111 #b00000000000000000000000))
  (=>
  (fp.lt (prev_representable x1) (fp #b0 #b00000000 #b00000000000000000000000))
  (=>
  (fp.lt (fp.neg (fp #b0 #b01111111 #b00000000000000000000000)) (prev_representable
                                                                x1))
  (=> (= x2 (fp #b0 #b01111111 #b00000000000000000000000))
  (=>
  (fp.lt (fp #b0 #b01111111 #b00000000000000000000000) (next_representable
                                                       x2))
  (=>
  (fp.lt (next_representable x2) (fp #b0 #b01111111 #b00011001100110011001101))
  (=>
  (fp.lt (prev_representable x2) (fp #b0 #b01111111 #b00000000000000000000000))
  (not (= x2 (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)))))))))))))))))
(check-sat)