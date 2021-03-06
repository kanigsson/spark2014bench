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

(declare-fun nth ((_ BitVec 32) Int) Bool)

(declare-fun lsr ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun asr ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun lsl ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun rotate_right1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun rotate_left1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 32))) Int (ite (bvsge x (_ bv0 32))
                                            (bv2int x)
                                            (- (- 4294967296 (bv2int x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 4294967295)))

(declare-fun nth_bv ((_ BitVec 32) (_ BitVec 32)) Bool)

(declare-fun eq_sub_bv ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)
  (_ BitVec 32)) Bool)

(define-fun eq_sub ((a (_ BitVec 32)) (b (_ BitVec 32)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content (_ BitVec 32))))))
(declare-fun power ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun bv_min ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) y x))

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

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

(declare-datatypes () ((t__ref1 (t__refqtmk1 (t__content1 Float32)))))
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

(declare-fun to_fp1 ((_ BitVec 32)) Float32)

(declare-fun to_fp__function_guard (Float32 (_ BitVec 32)) Bool)

(declare-sort source 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 32))

(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 32)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 32))

(declare-fun user_eq1 (source source) Bool)

(declare-const dummy1 source)

(declare-datatypes ()
((source__ref (source__refqtmk (source__content source)))))
(define-fun source__ref_source__content__projection ((a source__ref)) source 
  (source__content a))

(define-fun dynamic_invariant ((temp___expr_187 (_ BitVec 32))
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool) (temp___do_typ_inv_186 Bool)) Bool true)

(declare-sort target 0)

(declare-fun user_eq2 (target target) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Float32)

(declare-const dummy2 target)

(declare-datatypes ()
((target__ref (target__refqtmk (target__content target)))))
(define-fun target__ref_target__content__projection ((a target__ref)) target 
  (target__content a))

(define-fun dynamic_invariant1 ((temp___expr_194 Float32)
  (temp___is_init_190 Bool) (temp___skip_constant_191 Bool)
  (temp___do_toplevel_192 Bool)
  (temp___do_typ_inv_193 Bool)) Bool (=>
                                     (or (= temp___is_init_190 true)
                                     (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                     (fp.isFinite32 temp___expr_194)))

;; to_fp__post_axiom
  (assert
  (forall ((s (_ BitVec 32)))
  (! (=> (dynamic_invariant s true true true true)
     (let ((result (to_fp1 s)))
     (=> (to_fp__function_guard result s) (dynamic_invariant1 result true
     false true true)))) :pattern ((to_fp1 s)) )))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__test_pack__pid_obj__desired float__)(rec__test_pack__pid_obj__error float__)))))
(define-fun us_split_fields_rec__test_pack__pid_obj__desired__projection ((a us_split_fields)) float__ 
  (rec__test_pack__pid_obj__desired a))

(define-fun us_split_fields_rec__test_pack__pid_obj__error__projection ((a us_split_fields)) float__ 
  (rec__test_pack__pid_obj__error a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (fp.eq (to_rep
                               (rec__test_pack__pid_obj__desired
                               (us_split_fields1 a))) (to_rep
                                                      (rec__test_pack__pid_obj__desired
                                                      (us_split_fields1 b))))
                        (fp.eq (to_rep
                               (rec__test_pack__pid_obj__error
                               (us_split_fields1 a))) (to_rep
                                                      (rec__test_pack__pid_obj__error
                                                      (us_split_fields1 b)))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const test_pack__pid_obj__desired__first__bit Int)

(declare-const test_pack__pid_obj__desired__last__bit Int)

(declare-const test_pack__pid_obj__desired__position Int)

;; test_pack__pid_obj__desired__first__bit_axiom
  (assert (<= 0 test_pack__pid_obj__desired__first__bit))

;; test_pack__pid_obj__desired__last__bit_axiom
  (assert
  (< test_pack__pid_obj__desired__first__bit test_pack__pid_obj__desired__last__bit))

;; test_pack__pid_obj__desired__position_axiom
  (assert (<= 0 test_pack__pid_obj__desired__position))

(declare-const test_pack__pid_obj__error__first__bit Int)

(declare-const test_pack__pid_obj__error__last__bit Int)

(declare-const test_pack__pid_obj__error__position Int)

;; test_pack__pid_obj__error__first__bit_axiom
  (assert (<= 0 test_pack__pid_obj__error__first__bit))

;; test_pack__pid_obj__error__last__bit_axiom
  (assert
  (< test_pack__pid_obj__error__first__bit test_pack__pid_obj__error__last__bit))

;; test_pack__pid_obj__error__position_axiom
  (assert (<= 0 test_pack__pid_obj__error__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ()
((pid_obj__ref (pid_obj__refqtmk (pid_obj__content us_rep)))))
(define-fun pid_obj__ref_pid_obj__content__projection ((a pid_obj__ref)) us_rep 
  (pid_obj__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption ((temp___expr_202 us_rep)
  (temp___skip_top_level_203 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__test_pack__pid_obj__desired
                                            (us_split_fields1
                                            temp___expr_202))) (fp #b0 #b00000000 #b00000000000000000000000))
                                         (= (to_rep
                                            (rec__test_pack__pid_obj__error
                                            (us_split_fields1
                                            temp___expr_202))) (fp #b0 #b00000000 #b00000000000000000000000))))

(define-fun dynamic_invariant2 ((temp___expr_60 Float32)
  (temp___is_init_56 Bool) (temp___skip_constant_57 Bool)
  (temp___do_toplevel_58 Bool)
  (temp___do_typ_inv_59 Bool)) Bool (=>
                                    (or (= temp___is_init_56 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                    (fp.isFinite32 temp___expr_60)))

(declare-const o float__)

;; Ensures
  (assert (= (to_rep o) (fp #b0 #b00000000 #b00000000000000000000000)))

(define-fun o1 () Float32 (to_fp1 #x7F7FFF76))

;; H
  (assert (to_fp__function_guard o1 #x7F7FFF76))

;; H
  (assert (dynamic_invariant1 o1 true false true true))

(declare-const o2 float__)

;; Ensures
  (assert (= (to_rep o2) o1))

(declare-const x__split_fields us_split_fields)

;; H
  (assert (= x__split_fields (us_split_fieldsqtmk o2 o)))

;; Assume
  (assert true)

(define-fun o3 () Float32 (to_fp1 #xF7098000))

;; H
  (assert (to_fp__function_guard o3 #xF7098000))

;; H
  (assert (dynamic_invariant1 o3 true false true true))

;; H
  (assert (fp.lt (fp #b0 #b00000000 #b00000000000000000000000) o3))

(assert
;; defqtvc
 ;; File "wibble.adb", line 3, characters 0-0
  (not
  (fp.leq (fp.add RNE (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) 
  o3) (to_rep (rec__test_pack__pid_obj__desired x__split_fields)))))
(check-sat)

(exit)
