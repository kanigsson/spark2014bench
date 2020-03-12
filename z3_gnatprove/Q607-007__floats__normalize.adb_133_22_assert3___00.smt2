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

(declare-const x Float32)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun r3 (Float32) Float32)

(declare-fun r3__function_guard (Float32 Float32) Bool)

(declare-sort t_float32 0)

(define-fun in_range1 ((x1 Float32)) Bool (and (fp.isFinite32 x1)
                                          (and
                                          (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111101110)) x1)
                                          (fp.leq x1 (fp #b0 #b11111110 #b11111111111111111101110)))))

(declare-fun user_eq (t_float32 t_float32) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float32)

(declare-const dummy t_float32)

(declare-datatypes ()
((t_float32__ref (t_float32__refqtmk (t_float32__content t_float32)))))
(define-fun t_float32__ref_t_float32__content__projection ((a t_float32__ref)) t_float32 
  (t_float32__content a))

(define-fun dynamic_invariant ((temp___expr_177 Float32)
  (temp___is_init_173 Bool) (temp___skip_constant_174 Bool)
  (temp___do_toplevel_175 Bool)
  (temp___do_typ_inv_176 Bool)) Bool (=>
                                     (or (= temp___is_init_173 true)
                                     (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111101110)) (fp #b0 #b11111110 #b11111111111111111101110)))
                                     (in_range1 temp___expr_177)))

;; r3__post_axiom
  (assert
  (forall ((x1 Float32))
  (! (=>
     (and (dynamic_invariant x1 true true true true)
     (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111101110)) x1))
     (let ((result (r3 x1)))
     (=> (r3__function_guard result x1)
     (and
     (and (fp.leq result x1)
     (fp.leq (fp.sub RNE x1 (fp #b0 #b01111111 #b00000000000000000000000)) result))
     (dynamic_invariant result true false true true))))) :pattern ((r3 x1)) )))

;; r3__def_axiom
  (assert
  (forall ((x1 Float32))
  (! (=> (dynamic_invariant x1 true true true true)
     (= (r3 x1) (fp.roundToIntegral RTN x1))) :pattern ((r3 x1)) )))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort t1 0)

(define-fun in_range2 ((x1 Float32)) Bool (and (fp.isFinite32 x1)
                                          (and
                                          (fp.leq (fp.neg (fp #b0 #b10001000 #b01101000000000000000000)) x1)
                                          (fp.leq x1 (fp #b0 #b10001000 #b01101000000000000000000)))))

(declare-fun user_eq1 (t1 t1) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Float32)

(declare-const dummy1 t1)

(declare-datatypes () ((t1__ref (t1__refqtmk (t1__content t1)))))
(define-fun t1__ref_t1__content__projection ((a t1__ref)) t1 (t1__content a))

(define-fun dynamic_invariant1 ((temp___expr_184 Float32)
  (temp___is_init_180 Bool) (temp___skip_constant_181 Bool)
  (temp___do_toplevel_182 Bool)
  (temp___do_typ_inv_183 Bool)) Bool (=>
                                     (or (= temp___is_init_180 true)
                                     (fp.leq (fp.neg (fp #b0 #b10001000 #b01101000000000000000000)) (fp #b0 #b10001000 #b01101000000000000000000)))
                                     (in_range2 temp___expr_184)))

(declare-sort t2 0)

(define-fun in_range3 ((x1 Float32)) Bool (and (fp.isFinite32 x1)
                                          (and
                                          (fp.leq (fp.neg (fp #b0 #b10000000 #b10000000000000000000000)) x1)
                                          (fp.leq x1 (fp #b0 #b10000000 #b00000000000000000000000)))))

(declare-fun user_eq2 (t2 t2) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE3 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Float32)

(declare-const dummy2 t2)

(declare-datatypes () ((t2__ref (t2__refqtmk (t2__content t2)))))
(define-fun t2__ref_t2__content__projection ((a t2__ref)) t2 (t2__content a))

(define-fun dynamic_invariant2 ((temp___expr_191 Float32)
  (temp___is_init_187 Bool) (temp___skip_constant_188 Bool)
  (temp___do_toplevel_189 Bool)
  (temp___do_typ_inv_190 Bool)) Bool (=>
                                     (or (= temp___is_init_187 true)
                                     (fp.leq (fp.neg (fp #b0 #b10000000 #b10000000000000000000000)) (fp #b0 #b10000000 #b00000000000000000000000)))
                                     (in_range3 temp___expr_191)))

(declare-const v1 Float32)

(declare-const v2 Float32)

;; Assume
  (assert (dynamic_invariant1 x true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant v1 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant v2 false false true true))

(declare-const v11 Float32)

;; H
  (assert
  (= v11 (fp.div RNE x (fp #b0 #b10000111 #b01101000000000000000000))))

;; Assert
  (assert
  (and (fp.leq (fp.neg (fp #b0 #b10000000 #b00000000000000000000000)) 
  v11) (fp.leq v11 (fp #b0 #b10000000 #b00000000000000000000000))))

(define-fun o () Float32 (r3 v11))

;; H
  (assert (r3__function_guard o v11))

;; H
  (assert (dynamic_invariant o true false true true))

;; H
  (assert (= o (fp.roundToIntegral RTN v11)))

;; H
  (assert (fp.leq o v11))

;; H
  (assert
  (fp.leq (fp.sub RNE v11 (fp #b0 #b01111111 #b00000000000000000000000)) 
  o))

(declare-const v21 Float32)

;; H
  (assert (= v21 o))

(assert
;; defqtvc
 ;; File "normalize.ads", line 22, characters 0-0
  (not (fp.leq v21 v11)))
(check-sat)
