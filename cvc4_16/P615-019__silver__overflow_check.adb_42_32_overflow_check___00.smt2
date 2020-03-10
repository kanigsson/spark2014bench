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

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

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

(declare-const op Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const y Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const e Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort oper 0)

(define-fun in_range1 ((x1 Int)) Bool (and (<= 0 x1) (<= x1 6)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (oper oper) Bool)

(declare-const dummy1 oper)

(declare-datatypes ((oper__ref 0))
(((oper__refqtmk (oper__content oper)))))
(define-fun oper__ref_oper__content__projection ((a oper__ref)) oper 
  (oper__content a))

(define-fun dynamic_invariant1 ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (<= 0 6)) (in_range1 temp___expr_179)))

(declare-sort tfixedB 0)

(define-fun in_range2 ((x1 Int)) Bool (and (<= (- 128) x1) (<= x1 127)))

(declare-const dummy2 tfixedB)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (tfixedB tfixedB) Bool)

(declare-datatypes ((tfixedB__ref 0))
(((tfixedB__refqtmk (tfixedB__content tfixedB)))))
(define-fun tfixedB__ref_tfixedB__content__projection ((a tfixedB__ref)) tfixedB 
  (tfixedB__content a))

(declare-sort fixed 0)

(define-fun in_range3 ((x1 Int)) Bool (and (<= (- 128) x1) (<= x1 127)))

(declare-const dummy3 fixed)

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (fixed fixed) Bool)

(declare-datatypes ((fixed__ref 0))
(((fixed__refqtmk (fixed__content fixed)))))
(define-fun fixed__ref_fixed__content__projection ((a fixed__ref)) fixed 
  (fixed__content a))

(define-fun dynamic_invariant2 ((temp___expr_193 Int)
  (temp___is_init_189 Bool) (temp___skip_constant_190 Bool)
  (temp___do_toplevel_191 Bool)
  (temp___do_typ_inv_192 Bool)) Bool (=>
                                     (or (= temp___is_init_189 true)
                                     (<= (- 128) 127)) (in_range3
                                     temp___expr_193)))

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

(declare-fun fxp_mult (Int Int) Int)

;; fxp_mult_def
  (assert
  (forall ((x1 Int))
  (forall ((y1 Int))
  (! (ite (or (= x1 0) (= y1 0)) (= (fxp_mult x1 y1) 0)
     (ite (or (and (< 0 x1) (< 0 y1)) (and (< x1 0) (< y1 0)))
     (pos_div_relation (fxp_mult x1 y1) (* (* (* (* x1 y1) 1) 1) 128)
     (* (* 128 128) 1)) (pos_div_relation (- (fxp_mult x1 y1))
     (- (* (* (* (* x1 y1) 1) 1) 128)) (* (* 128 128) 1)))) :pattern (
  (fxp_mult x1 y1)) ))))

(declare-fun fxp_div (Int Int) Int)

;; fxp_div_def
  (assert
  (forall ((x1 Int))
  (forall ((y1 Int))
  (! (ite (= x1 0) (= (fxp_div x1 y1) 0)
     (ite (and (< 0 x1) (< 0 y1)) (pos_div_relation (fxp_div x1 y1)
     (* (* (* x1 1) 128) 128) (* (* (* y1 128) 1) 1))
     (ite (and (< x1 0) (< y1 0)) (pos_div_relation (fxp_div x1 y1)
     (* (* (* (- x1) 1) 128) 128) (* (* (* (- y1) 128) 1) 1))
     (ite (and (< x1 0) (< 0 y1)) (pos_div_relation (- (fxp_div x1 y1))
     (* (* (* (- x1) 1) 128) 128) (* (* (* y1 128) 1) 1))
     (=> (and (< 0 x1) (< y1 0)) (pos_div_relation (- (fxp_div x1 y1))
     (* (* (* x1 1) 128) 128) (* (* (* (- y1) 128) 1) 1))))))) :pattern (
  (fxp_div x1 y1)) ))))

(assert
;; defqtvc
 ;; File "overflow_check.adb", line 35, characters 0-0
  (not
  (forall ((u Int) (spark__branch Bool) (spark__branch1 Bool)
  (spark__branch2 Bool) (spark__branch3 Bool) (spark__branch4 Bool))
  (=> (dynamic_invariant1 op true false true true)
  (=> (dynamic_invariant2 x true false true true)
  (=> (dynamic_invariant2 y true false true true)
  (=> (dynamic_invariant e true false true true)
  (=> (dynamic_invariant2 u false false true true)
  (=> (= spark__branch (ite (= op 0) true false))
  (=> (not (= spark__branch true))
  (=> (= spark__branch1 (ite (= op 1) true false))
  (=> (not (= spark__branch1 true))
  (=> (= spark__branch2 (ite (= op 2) true false))
  (=> (not (= spark__branch2 true))
  (=> (= spark__branch3 (ite (= op 3) true false))
  (=> (not (= spark__branch3 true))
  (=> (= spark__branch4 (ite (= op 4) true false))
  (=> (= spark__branch4 true) (in_range2 (fxp_mult x y))))))))))))))))))))
(check-sat)
(exit)
