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

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

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
  (forall ((x1 Int) (y Int))
  (= (<= (abs1 x1) y) (and (<= (- y) x1) (<= x1 y)))))

;; Abs_pos
  (assert (forall ((x1 Int)) (<= 0 (abs1 x1))))

(declare-fun div1 (Int Int) Int)

(declare-fun mod1 (Int Int) Int)

;; Div_mod
  (assert
  (forall ((x1 Int) (y Int))
  (=> (not (= y 0)) (= x1 (+ (* y (div1 x1 y)) (mod1 x1 y))))))

;; Div_bound
  (assert
  (forall ((x1 Int) (y Int))
  (=> (and (<= 0 x1) (< 0 y)) (and (<= 0 (div1 x1 y)) (<= (div1 x1 y) x1)))))

;; Mod_bound
  (assert
  (forall ((x1 Int) (y Int))
  (=> (not (= y 0))
  (and (< (- (abs1 y)) (mod1 x1 y)) (< (mod1 x1 y) (abs1 y))))))

;; Div_sign_pos
  (assert
  (forall ((x1 Int) (y Int)) (=> (and (<= 0 x1) (< 0 y)) (<= 0 (div1 x1 y)))))

;; Div_sign_neg
  (assert
  (forall ((x1 Int) (y Int)) (=> (and (<= x1 0) (< 0 y)) (<= (div1 x1 y) 0))))

;; Mod_sign_pos
  (assert
  (forall ((x1 Int) (y Int))
  (=> (and (<= 0 x1) (not (= y 0))) (<= 0 (mod1 x1 y)))))

;; Mod_sign_neg
  (assert
  (forall ((x1 Int) (y Int))
  (=> (and (<= x1 0) (not (= y 0))) (<= (mod1 x1 y) 0))))

;; Rounds_toward_zero
  (assert
  (forall ((x1 Int) (y Int))
  (=> (not (= y 0)) (<= (abs1 (* (div1 x1 y) y)) (abs1 x1)))))

;; Div_1
  (assert (forall ((x1 Int)) (= (div1 x1 1) x1)))

;; Mod_1
  (assert (forall ((x1 Int)) (= (mod1 x1 1) 0)))

;; Div_inf
  (assert
  (forall ((x1 Int) (y Int)) (=> (and (<= 0 x1) (< x1 y)) (= (div1 x1 y) 0))))

;; Mod_inf
  (assert
  (forall ((x1 Int) (y Int))
  (=> (and (<= 0 x1) (< x1 y)) (= (mod1 x1 y) x1))))

;; Div_mult
  (assert
  (forall ((x1 Int) (y Int) (z Int))
  (! (=> (and (< 0 x1) (and (<= 0 y) (<= 0 z)))
     (= (div1 (+ (* x1 y) z) x1) (+ y (div1 z x1)))) :pattern ((div1
                                                               (+ (* x1 y) z)
                                                               x1)) )))

;; Mod_mult
  (assert
  (forall ((x1 Int) (y Int) (z Int))
  (! (=> (and (< 0 x1) (and (<= 0 y) (<= 0 z)))
     (= (mod1 (+ (* x1 y) z) x1) (mod1 z x1))) :pattern ((mod1 (+ (* x1 y) z)
                                                         x1)) )))

;; Div_unique
  (assert
  (forall ((x1 Int) (y Int) (q Int))
  (=> (< 0 y)
  (=> (and (<= (* q y) x1) (< x1 (+ (* q y) y))) (= (div x1 y) q)))))

;; Div_bound
  (assert
  (forall ((x1 Int) (y Int))
  (=> (and (<= 0 x1) (< 0 y)) (and (<= 0 (div x1 y)) (<= (div x1 y) x1)))))

;; Div_inf
  (assert
  (forall ((x1 Int) (y Int)) (=> (and (<= 0 x1) (< x1 y)) (= (div x1 y) 0))))

;; Div_inf_neg
  (assert
  (forall ((x1 Int) (y Int))
  (=> (and (< 0 x1) (<= x1 y)) (= (div (- x1) y) (- 1)))))

;; Mod_0
  (assert (forall ((y Int)) (=> (not (= y 0)) (= (mod 0 y) 0))))

;; Div_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div 1 y) 0))))

;; Div_minus1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div (- 1) y) (- 1)))))

;; Mod_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (mod 1 y) 1))))

;; Mod_minus1_left
  (assert
  (forall ((y Int))
  (! (=> (< 1 y) (= (mod (- 1) y) (- y 1))) :pattern ((mod (- 1) y)) )))

;; Div_mult
  (assert
  (forall ((x1 Int) (y Int) (z Int))
  (! (=> (< 0 x1) (= (div (+ (* x1 y) z) x1) (+ y (div z x1)))) :pattern ((div (+ (* x1 y) z) x1)) )))

;; Mod_mult
  (assert
  (forall ((x1 Int) (y Int) (z Int))
  (! (=> (< 0 x1) (= (mod (+ (* x1 y) z) x1) (mod z x1))) :pattern ((mod (+ (* x1 y) z) x1)) )))

(define-fun mod2 ((x1 Int)
  (y Int)) Int (ite (< 0 y) (mod x1 y) (+ (mod x1 y) y)))

(define-fun pos_div_relation ((res Int) (num Int)
  (den Int)) Bool (let ((exact (div1 num den)))
                  (ite (= num 0) (= res 0)
                  (ite (= num (* exact den)) (= res exact)
                  (and (<= exact res) (<= res (+ exact 1)))))))

(declare-fun fxp_div_int (Int Int) Int)

;; fxp_div_int_def
  (assert
  (forall ((x1 Int))
  (forall ((y Int))
  (! (ite (= x1 0) (= (fxp_div_int x1 y) 0)
     (ite (and (< 0 x1) (< 0 y)) (pos_div_relation (fxp_div_int x1 y) x1 y)
     (ite (and (< x1 0) (< y 0)) (pos_div_relation (fxp_div_int x1 y) (- x1)
     (- y))
     (ite (and (< x1 0) (< 0 y)) (pos_div_relation (- (fxp_div_int x1 y))
     (- x1) y)
     (=> (and (< 0 x1) (< y 0)) (pos_div_relation (- (fxp_div_int x1 y)) x1
     (- y))))))) :pattern ((fxp_div_int x1 y)) ))))

(declare-fun to_int1 (Int) Int)

;; to_int_def
  (assert
  (forall ((x1 Int))
  (! (ite (= x1 0) (= (to_int1 x1) 0)
     (ite (< 0 x1) (pos_div_relation (to_int1 x1) (* x1 1) 400)
     (pos_div_relation (- (to_int1 x1)) (* (- x1) 1) 400))) :pattern (
  (to_int1 x1)) )))

(declare-fun of_int (Int) Int)

;; of_int_def
  (assert
  (forall ((x1 Int))
  (! (ite (= x1 0) (= (of_int x1) 0)
     (ite (< 0 x1) (pos_div_relation (of_int x1) (* x1 400) 1)
     (pos_div_relation (- (of_int x1)) (* (- x1) 400) 1))) :pattern (
  (of_int x1)) )))

(declare-sort t 0)

(define-fun in_range3 ((x1 Int)) Bool (and (<= (- 4000) x1) (<= x1 4000)))

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
                                     (<= (- 4000) 4000)) (in_range3
                                     temp___expr_158)))

(declare-sort ty2S 0)

(declare-fun ty2Sqtint (ty2S) Int)

;; ty2S'axiom
  (assert
  (forall ((i ty2S)) (and (<= 0 (ty2Sqtint i)) (<= (ty2Sqtint i) 10))))

(define-fun in_range4 ((x1 Int)) Bool (and (<= 0 x1) (<= x1 10)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (ty2S ty2S) Bool)

(declare-const dummy3 ty2S)

(declare-datatypes ((ty2S__ref 0))
(((ty2S__refqtmk (ty2S__content ty2S)))))
(define-fun ty2S__ref_ty2S__content__projection ((a ty2S__ref)) ty2S 
  (ty2S__content a))

(define-fun dynamic_invariant2 ((temp___expr_165 Int)
  (temp___is_init_161 Bool) (temp___skip_constant_162 Bool)
  (temp___do_toplevel_163 Bool)
  (temp___do_typ_inv_164 Bool)) Bool (=>
                                     (or (= temp___is_init_161 true)
                                     (<= 0 10)) (in_range4 temp___expr_165)))

(declare-sort t3 0)

(declare-fun t3qtint (t3) Int)

;; t3'axiom
  (assert (forall ((i t3)) (and (<= 0 (t3qtint i)) (<= (t3qtint i) 10))))

(define-fun in_range5 ((x1 Int)) Bool (and (<= 0 x1) (<= x1 10)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq4 (t3 t3) Bool)

(declare-const dummy4 t3)

(declare-datatypes ((t3__ref 0))
(((t3__refqtmk (t3__content t3)))))
(define-fun t3__ref_t3__content__projection ((a t3__ref)) t3 (t3__content a))

(define-fun dynamic_invariant3 ((temp___expr_172 Int)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (=>
                                     (or (= temp___is_init_168 true)
                                     (<= 0 10)) (in_range5 temp___expr_172)))

(assert
;; defqtvc
 ;; File "ordinary_fixed.ads", line 21, characters 0-0
  (not
  (forall ((y1 Int) (y2 Int) (y3 Int) (u Int))
  (=> (dynamic_invariant1 x true false true true)
  (=> (<= (- 2000) x)
  (=> (<= x 2000)
  (=> (dynamic_invariant y1 false false true true)
  (=> (dynamic_invariant2 y2 false false true true)
  (=> (dynamic_invariant3 y3 false false true true)
  (=> (dynamic_invariant1 u false false true true)
  (let ((o (to_int1 x)))
  (=> (in_range1 o)
  (forall ((y11 Int))
  (=> (= y11 o)
  (forall ((spark__branch Bool))
  (=> (= spark__branch (ite (<= 0 x) true false))
  (=> (= spark__branch true)
  (let ((o1 (to_int1 x))) (=> (in_range1 o1) (in_range4 o1))))))))))))))))))))
(check-sat)
(exit)
