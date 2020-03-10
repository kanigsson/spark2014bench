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
(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(declare-sort float__ 0)

(declare-fun user_eq1 (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float32)

(declare-const dummy1 float__)

(declare-datatypes ((float____ref 0))
(((float____refqtmk (float____content float__)))))
(define-fun float____ref_float____content__projection ((a float____ref)) float__ 
  (float____content a))

(define-fun dynamic_invariant1 ((temp___expr_60 Float32)
  (temp___is_init_56 Bool) (temp___skip_constant_57 Bool)
  (temp___do_toplevel_58 Bool)
  (temp___do_typ_inv_59 Bool)) Bool (=>
                                    (or (= temp___is_init_56 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                    (fp.isFinite32 temp___expr_60)))

(declare-fun ident (Int) Int)

(declare-fun ident__function_guard (Int Int) Bool)

;; ident__post_axiom
  (assert
  (forall ((n Int))
  (! (=>
     (and (dynamic_invariant n true true true true) (and (<= 1 n) (<= n 10)))
     (let ((result (ident n)))
     (=> (ident__function_guard result n) (dynamic_invariant result true
     false true true)))) :pattern ((ident n)) )))

(declare-fun ident1 (Int) Int)

(declare-fun ident__function_guard1 (Int Int) Bool)

(declare-sort color 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (color color) Bool)

(declare-const dummy2 color)

(declare-datatypes ((color__ref 0))
(((color__refqtmk (color__content color)))))
(define-fun color__ref_color__content__projection ((a color__ref)) color 
  (color__content a))

(define-fun dynamic_invariant2 ((temp___expr_184 Int)
  (temp___is_init_180 Bool) (temp___skip_constant_181 Bool)
  (temp___do_toplevel_182 Bool)
  (temp___do_typ_inv_183 Bool)) Bool (=>
                                     (or (= temp___is_init_180 true)
                                     (<= 0 2)) (in_range1 temp___expr_184)))

;; ident__post_axiom
  (assert
  (forall ((c Int))
  (! (=>
     (and (dynamic_invariant2 c true true true true) (and (<= 0 c) (<= c 1)))
     (let ((result (ident1 c)))
     (=> (ident__function_guard1 result c) (dynamic_invariant2 result true
     false true true)))) :pattern ((ident1 c)) )))

(declare-fun ident2 (Int) Int)

(declare-fun ident__function_guard2 (Int Int) Bool)

(declare-sort volt 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2040)))

(declare-const dummy3 volt)

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (volt volt) Bool)

(declare-datatypes ((volt__ref 0))
(((volt__refqtmk (volt__content volt)))))
(define-fun volt__ref_volt__content__projection ((a volt__ref)) volt 
  (volt__content a))

(define-fun dynamic_invariant3 ((temp___expr_191 Int)
  (temp___is_init_187 Bool) (temp___skip_constant_188 Bool)
  (temp___do_toplevel_189 Bool)
  (temp___do_typ_inv_190 Bool)) Bool (=>
                                     (or (= temp___is_init_187 true)
                                     (<= 0 2040)) (in_range2
                                     temp___expr_191)))

;; ident__post_axiom
  (assert
  (forall ((v Int))
  (! (=>
     (and (dynamic_invariant3 v true true true true) (and (<= 1 v) (<= v 9)))
     (let ((result (ident2 v)))
     (=> (ident__function_guard2 result v) (dynamic_invariant3 result true
     false true true)))) :pattern ((ident2 v)) )))

(declare-fun ident3 (Int) Int)

(declare-fun ident__function_guard3 (Int Int) Bool)

(declare-sort money 0)

(define-fun in_range3 ((x Int)) Bool (and (<= (- 999999999999999) x)
                                     (<= x 999999999999999)))

(declare-const dummy4 money)

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (money money) Bool)

(declare-datatypes ((money__ref 0))
(((money__refqtmk (money__content money)))))
(define-fun money__ref_money__content__projection ((a money__ref)) money 
  (money__content a))

(define-fun dynamic_invariant4 ((temp___expr_198 Int)
  (temp___is_init_194 Bool) (temp___skip_constant_195 Bool)
  (temp___do_toplevel_196 Bool)
  (temp___do_typ_inv_197 Bool)) Bool (=>
                                     (or (= temp___is_init_194 true)
                                     (<= (- 999999999999999) 999999999999999))
                                     (in_range3 temp___expr_198)))

;; ident__post_axiom
  (assert
  (forall ((m Int))
  (! (=>
     (and (dynamic_invariant4 m true true true true)
     (and (<= 10 m) (<= m 1010)))
     (let ((result (ident3 m)))
     (=> (ident__function_guard3 result m) (dynamic_invariant4 result true
     false true true)))) :pattern ((ident3 m)) )))

(declare-fun ident4 (Float32) Float32)

(declare-fun ident__function_guard4 (Float32 Float32) Bool)

;; ident__post_axiom
  (assert
  (forall ((f Float32))
  (! (=>
     (and (dynamic_invariant1 f true true true true)
     (and (fp.leq (fp.neg (fp #b0 #b01111110 #b11111111011111001110111)) f)
     (fp.leq f (fp #b0 #b01111110 #b11111111011111001110111))))
     (let ((result (ident4 f)))
     (=> (ident__function_guard4 result f) (dynamic_invariant1 result true
     false true true)))) :pattern ((ident4 f)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(assert
;; defqtvc
 ;; File "p.adb", line 1, characters 0-0
  (not (<= 1 5)))
(check-sat)
(exit)
