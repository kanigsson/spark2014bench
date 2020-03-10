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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const y Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort ttB 0)

(define-fun in_range2 ((x1 Int)) Bool (and (<= (- 32768) x1) (<= x1 32767)))

(declare-const dummy1 ttB)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (ttB ttB) Bool)

(declare-datatypes ((ttB__ref 0))
(((ttB__refqtmk (ttB__content ttB)))))
(define-fun ttB__ref_ttB__content__projection ((a ttB__ref)) ttB (ttB__content
                                                                 a))

(define-fun abs1 ((x1 Int)) Int (ite (<= 0 x1) x1 (- x1)))

;; Abs_le
  (assert
  (forall ((x1 Int) (y1 Int))
  (= (<= (abs1 x1) y1) (and (<= (- y1) x1) (<= x1 y1)))))

;; Abs_pos
  (assert (forall ((x1 Int)) (<= 0 (abs1 x1))))

(declare-fun div1 (Int Int) Int)

(declare-fun mod1 (Int Int) Int)

;; Div_mod
  (assert
  (forall ((x1 Int) (y1 Int))
  (=> (not (= y1 0)) (= x1 (+ (* y1 (div1 x1 y1)) (mod1 x1 y1))))))

;; Div_bound
  (assert
  (forall ((x1 Int) (y1 Int))
  (=> (and (<= 0 x1) (< 0 y1))
  (and (<= 0 (div1 x1 y1)) (<= (div1 x1 y1) x1)))))

;; Mod_bound
  (assert
  (forall ((x1 Int) (y1 Int))
  (=> (not (= y1 0))
  (and (< (- (abs1 y1)) (mod1 x1 y1)) (< (mod1 x1 y1) (abs1 y1))))))

;; Div_sign_pos
  (assert
  (forall ((x1 Int) (y1 Int))
  (=> (and (<= 0 x1) (< 0 y1)) (<= 0 (div1 x1 y1)))))

;; Div_sign_neg
  (assert
  (forall ((x1 Int) (y1 Int))
  (=> (and (<= x1 0) (< 0 y1)) (<= (div1 x1 y1) 0))))

;; Mod_sign_pos
  (assert
  (forall ((x1 Int) (y1 Int))
  (=> (and (<= 0 x1) (not (= y1 0))) (<= 0 (mod1 x1 y1)))))

;; Mod_sign_neg
  (assert
  (forall ((x1 Int) (y1 Int))
  (=> (and (<= x1 0) (not (= y1 0))) (<= (mod1 x1 y1) 0))))

;; Rounds_toward_zero
  (assert
  (forall ((x1 Int) (y1 Int))
  (=> (not (= y1 0)) (<= (abs1 (* (div1 x1 y1) y1)) (abs1 x1)))))

;; Div_1
  (assert (forall ((x1 Int)) (= (div1 x1 1) x1)))

;; Mod_1
  (assert (forall ((x1 Int)) (= (mod1 x1 1) 0)))

;; Div_inf
  (assert
  (forall ((x1 Int) (y1 Int))
  (=> (and (<= 0 x1) (< x1 y1)) (= (div1 x1 y1) 0))))

;; Mod_inf
  (assert
  (forall ((x1 Int) (y1 Int))
  (=> (and (<= 0 x1) (< x1 y1)) (= (mod1 x1 y1) x1))))

;; Div_mult
  (assert
  (forall ((x1 Int) (y1 Int) (z Int))
  (! (=> (and (< 0 x1) (and (<= 0 y1) (<= 0 z)))
     (= (div1 (+ (* x1 y1) z) x1) (+ y1 (div1 z x1)))) :pattern ((div1
                                                                 (+ (* x1 y1) z)
                                                                 x1)) )))

;; Mod_mult
  (assert
  (forall ((x1 Int) (y1 Int) (z Int))
  (! (=> (and (< 0 x1) (and (<= 0 y1) (<= 0 z)))
     (= (mod1 (+ (* x1 y1) z) x1) (mod1 z x1))) :pattern ((mod1
                                                          (+ (* x1 y1) z) x1)) )))

;; Div_unique
  (assert
  (forall ((x1 Int) (y1 Int) (q Int))
  (=> (< 0 y1)
  (=> (and (<= (* q y1) x1) (< x1 (+ (* q y1) y1))) (= (div x1 y1) q)))))

;; Div_bound
  (assert
  (forall ((x1 Int) (y1 Int))
  (=> (and (<= 0 x1) (< 0 y1)) (and (<= 0 (div x1 y1)) (<= (div x1 y1) x1)))))

;; Div_inf
  (assert
  (forall ((x1 Int) (y1 Int))
  (=> (and (<= 0 x1) (< x1 y1)) (= (div x1 y1) 0))))

;; Div_inf_neg
  (assert
  (forall ((x1 Int) (y1 Int))
  (=> (and (< 0 x1) (<= x1 y1)) (= (div (- x1) y1) (- 1)))))

;; Mod_0
  (assert (forall ((y1 Int)) (=> (not (= y1 0)) (= (mod 0 y1) 0))))

;; Div_1_left
  (assert (forall ((y1 Int)) (=> (< 1 y1) (= (div 1 y1) 0))))

;; Div_minus1_left
  (assert (forall ((y1 Int)) (=> (< 1 y1) (= (div (- 1) y1) (- 1)))))

;; Mod_1_left
  (assert (forall ((y1 Int)) (=> (< 1 y1) (= (mod 1 y1) 1))))

;; Mod_minus1_left
  (assert
  (forall ((y1 Int))
  (! (=> (< 1 y1) (= (mod (- 1) y1) (- y1 1))) :pattern ((mod (- 1) y1)) )))

;; Div_mult
  (assert
  (forall ((x1 Int) (y1 Int) (z Int))
  (! (=> (< 0 x1) (= (div (+ (* x1 y1) z) x1) (+ y1 (div z x1)))) :pattern ((div (+ (* x1 y1) z) x1)) )))

;; Mod_mult
  (assert
  (forall ((x1 Int) (y1 Int) (z Int))
  (! (=> (< 0 x1) (= (mod (+ (* x1 y1) z) x1) (mod z x1))) :pattern ((mod (+ (* x1 y1) z) x1)) )))

(define-fun mod2 ((x1 Int)
  (y1 Int)) Int (ite (< 0 y1) (mod x1 y1) (+ (mod x1 y1) y1)))

(define-fun pos_div_relation ((res Int) (num Int)
  (den Int)) Bool (let ((exact (div1 num den)))
                  (ite (= num 0) (= res 0)
                  (ite (= num (* exact den)) (= res exact)
                  (and (<= exact res) (<= res (+ exact 1)))))))

(declare-fun fxp_div_int (Int Int) Int)

;; fxp_div_int_def
  (assert
  (forall ((x1 Int))
  (forall ((y1 Int))
  (! (ite (= x1 0) (= (fxp_div_int x1 y1) 0)
     (ite (and (< 0 x1) (< 0 y1)) (pos_div_relation (fxp_div_int x1 y1) x1
     y1)
     (ite (and (< x1 0) (< y1 0)) (pos_div_relation (fxp_div_int x1 y1)
     (- x1) (- y1))
     (ite (and (< x1 0) (< 0 y1)) (pos_div_relation (- (fxp_div_int x1 y1))
     (- x1) y1)
     (=> (and (< 0 x1) (< y1 0)) (pos_div_relation (- (fxp_div_int x1 y1)) x1
     (- y1))))))) :pattern ((fxp_div_int x1 y1)) ))))

(declare-fun to_int1 (Int) Int)

;; to_int_def
  (assert
  (forall ((x1 Int))
  (! (ite (= x1 0) (= (to_int1 x1) 0)
     (ite (< 0 x1) (pos_div_relation (to_int1 x1) (* x1 1) 256)
     (pos_div_relation (- (to_int1 x1)) (* (- x1) 1) 256))) :pattern (
  (to_int1 x1)) )))

(declare-fun of_int (Int) Int)

;; of_int_def
  (assert
  (forall ((x1 Int))
  (! (ite (= x1 0) (= (of_int x1) 0)
     (ite (< 0 x1) (pos_div_relation (of_int x1) (* x1 256) 1)
     (pos_div_relation (- (of_int x1)) (* (- x1) 256) 1))) :pattern (
  (of_int x1)) )))

(declare-sort t 0)

(define-fun in_range3 ((x1 Int)) Bool (and (<= (- 2560) x1) (<= x1 2560)))

(declare-const dummy2 t)

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (t t) Bool)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content t)))))
(define-fun t__ref_t__content__projection ((a t__ref)) t (t__content a))

(define-fun dynamic_invariant1 ((temp___expr_158 Int)
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool)
  (temp___do_typ_inv_157 Bool)) Bool (=>
                                     (or (= temp___is_init_154 true)
                                     (<= (- 2560) 2560)) (in_range3
                                     temp___expr_158)))

(declare-fun fxp_mult (Int Int) Int)

;; fxp_mult_def
  (assert
  (forall ((x1 Int))
  (forall ((y1 Int))
  (! (ite (or (= x1 0) (= y1 0)) (= (fxp_mult x1 y1) 0)
     (ite (or (and (< 0 x1) (< 0 y1)) (and (< x1 0) (< y1 0)))
     (pos_div_relation (fxp_mult x1 y1) (* (* (* (* x1 y1) 1) 1) 256)
     (* (* 256 256) 1)) (pos_div_relation (- (fxp_mult x1 y1))
     (- (* (* (* (* x1 y1) 1) 1) 256)) (* (* 256 256) 1)))) :pattern (
  (fxp_mult x1 y1)) ))))

(declare-fun fxp_div (Int Int) Int)

;; fxp_div_def
  (assert
  (forall ((x1 Int))
  (forall ((y1 Int))
  (! (ite (= x1 0) (= (fxp_div x1 y1) 0)
     (ite (and (< 0 x1) (< 0 y1)) (pos_div_relation (fxp_div x1 y1)
     (* (* (* x1 1) 256) 256) (* (* (* y1 256) 1) 1))
     (ite (and (< x1 0) (< y1 0)) (pos_div_relation (fxp_div x1 y1)
     (* (* (* (- x1) 1) 256) 256) (* (* (* (- y1) 256) 1) 1))
     (ite (and (< x1 0) (< 0 y1)) (pos_div_relation (- (fxp_div x1 y1))
     (* (* (* (- x1) 1) 256) 256) (* (* (* y1 256) 1) 1))
     (=> (and (< 0 x1) (< y1 0)) (pos_div_relation (- (fxp_div x1 y1))
     (* (* (* x1 1) 256) 256) (* (* (* (- y1) 256) 1) 1))))))) :pattern (
  (fxp_div x1 y1)) ))))

;; y__def_axiom
  (assert (= y 512))

(assert
;; defqtvc
 ;; File "binary_fixed.ads", line 14, characters 0-0
  (not
  (forall ((z Int) (two Int))
  (=> (dynamic_invariant1 x true false true true)
  (=> (<= (- 1280) x)
  (=> (<= x 1280)
  (=> (dynamic_invariant1 y true false true true)
  (=> (= two 2)
  (=> (dynamic_invariant two true false true true)
  (=> (dynamic_invariant1 z false false true true)
  (forall ((z1 Int))
  (=> (= z1 (* x 2))
  (=> (= z1 (+ x x))
  (forall ((z2 Int))
  (=> (= z2 (* x 2))
  (=> (= z2 (+ x x))
  (forall ((z3 Int))
  (=> (= z3 (* x two)) (=> (= z3 (+ x x)) (in_range2 (* x two)))))))))))))))))))))
(check-sat)
(exit)
