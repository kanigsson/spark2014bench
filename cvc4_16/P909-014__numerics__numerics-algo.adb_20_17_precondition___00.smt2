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
(declare-const x Float32)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-fun oadd (Float32 Float32) Float32)

(declare-fun oadd__function_guard (Float32 Float32 Float32) Bool)

(declare-sort t_float 0)

(declare-fun user_eq (t_float t_float) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Float32)

(declare-const dummy t_float)

(declare-datatypes ((t_float__ref 0))
(((t_float__refqtmk (t_float__content t_float)))))
(define-fun t_float__ref_t_float__content__projection ((a t_float__ref)) t_float 
  (t_float__content a))

(define-fun dynamic_invariant ((temp___expr_162 Float32)
  (temp___is_init_158 Bool) (temp___skip_constant_159 Bool)
  (temp___do_toplevel_160 Bool)
  (temp___do_typ_inv_161 Bool)) Bool (=>
                                     (or (= temp___is_init_158 true)
                                     (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                     (fp.isFinite32 temp___expr_162)))

;; oadd__post_axiom
  (assert
  (forall ((left Float32) (right Float32))
  (! (=>
     (and (dynamic_invariant left true true true true) (dynamic_invariant
     right true true true true))
     (let ((result (oadd left right)))
     (=> (oadd__function_guard result left right) (dynamic_invariant result
     true false true true)))) :pattern ((oadd left right)) )))

;; oadd__def_axiom
  (assert
  (forall ((left Float32) (right Float32))
  (! (=>
     (and (dynamic_invariant left true true true true) (dynamic_invariant
     right true true true true))
     (= (oadd left right) (fp.add RNE left right))) :pattern ((oadd left
                                                              right)) )))

(declare-fun osubtract (Float32 Float32) Float32)

(declare-fun osubtract__function_guard (Float32 Float32 Float32) Bool)

;; osubtract__post_axiom
  (assert
  (forall ((left Float32) (right Float32))
  (! (=>
     (and (dynamic_invariant left true true true true) (dynamic_invariant
     right true true true true))
     (let ((result (osubtract left right)))
     (=> (osubtract__function_guard result left right) (dynamic_invariant
     result true false true true)))) :pattern ((osubtract left right)) )))

;; osubtract__def_axiom
  (assert
  (forall ((left Float32) (right Float32))
  (! (=>
     (and (dynamic_invariant left true true true true) (dynamic_invariant
     right true true true true))
     (= (osubtract left right) (fp.sub RNE left right))) :pattern ((osubtract
                                                                   left
                                                                   right)) )))

(declare-fun omultiply (Float32 Float32) Float32)

(declare-fun omultiply__function_guard (Float32 Float32 Float32) Bool)

;; omultiply__post_axiom
  (assert
  (forall ((left Float32) (right Float32))
  (! (=>
     (and (dynamic_invariant left true true true true) (dynamic_invariant
     right true true true true))
     (let ((result (omultiply left right)))
     (=> (omultiply__function_guard result left right) (dynamic_invariant
     result true false true true)))) :pattern ((omultiply left right)) )))

;; omultiply__def_axiom
  (assert
  (forall ((left Float32) (right Float32))
  (! (=>
     (and (dynamic_invariant left true true true true) (dynamic_invariant
     right true true true true))
     (= (omultiply left right) (fp.mul RNE left right))) :pattern ((omultiply
                                                                   left
                                                                   right)) )))

(declare-fun odivide (Float32 Float32) Float32)

(declare-fun odivide__function_guard (Float32 Float32 Float32) Bool)

;; odivide__post_axiom
  (assert
  (forall ((left Float32) (right Float32))
  (! (=>
     (and
     (and (dynamic_invariant left true true true true) (dynamic_invariant
     right true true true true))
     (not (fp.eq right (fp #b0 #b00000000 #b00000000000000000000000))))
     (let ((result (odivide left right)))
     (=> (odivide__function_guard result left right) (dynamic_invariant
     result true false true true)))) :pattern ((odivide left right)) )))

;; odivide__def_axiom
  (assert
  (forall ((left Float32) (right Float32))
  (! (=>
     (and (dynamic_invariant left true true true true) (dynamic_invariant
     right true true true true))
     (= (odivide left right) (fp.div RNE left right))) :pattern ((odivide
                                                                 left right)) )))

(assert
;; defqtvc
 ;; File "numerics-algo.ads", line 5, characters 0-0
  (not
  (forall ((x1 Float32) (x2 Float32) (x3 Float32) (x4 Float32) (x5 Float32)
  (x11 Float32))
  (=> (dynamic_invariant x true false true true)
  (=> (dynamic_invariant x1 false false true true)
  (=> (dynamic_invariant x2 false false true true)
  (=> (dynamic_invariant x3 false false true true)
  (=> (dynamic_invariant x4 false false true true)
  (=> (dynamic_invariant x5 false false true true)
  (=> (= x11 (fp #b0 #b11111110 #b11111111111111111111111))
  (let ((o (oadd x11 x11)))
  (=>
  (and (oadd__function_guard o x11 x11)
  (and (dynamic_invariant o true false true true) (= o (fp.add RNE x11 x11))))
  (forall ((x21 Float32))
  (=> (= x21 (fp #b0 #b11111110 #b11111111111111111111111))
  (let ((o1 (fp.neg x21)))
  (let ((o2 (osubtract o1 x21)))
  (=>
  (and (osubtract__function_guard o2 o1 x21)
  (and (dynamic_invariant o2 true false true true)
  (= o2 (fp.sub RNE o1 x21))))
  (forall ((x31 Float32))
  (=> (= x31 (fp #b0 #b11111110 #b11111111111111111111111))
  (let ((o3 (omultiply x31 x31)))
  (=>
  (and (omultiply__function_guard o3 x31 x31)
  (and (dynamic_invariant o3 true false true true)
  (= o3 (fp.mul RNE x31 x31))))
  (forall ((x41 Float32))
  (=> (= x41 (fp #b0 #b10000000 #b10000000000000000000000))
  (let ((o4 (osubtract x41 x41)))
  (=>
  (and (osubtract__function_guard o4 x41 x41)
  (and (dynamic_invariant o4 true false true true)
  (= o4 (fp.sub RNE x41 x41))))
  (let ((o5 (odivide (fp #b0 #b01111111 #b00000000000000000000000) o4)))
  (=>
  (and (odivide__function_guard o5
  (fp #b0 #b01111111 #b00000000000000000000000) o4)
  (and (dynamic_invariant o5 true false true true)
  (= o5 (fp.div RNE (fp #b0 #b01111111 #b00000000000000000000000) o4))))
  (not (fp.eq x (fp #b0 #b00000000 #b00000000000000000000000))))))))))))))))))))))))))))))
(check-sat)
(exit)
