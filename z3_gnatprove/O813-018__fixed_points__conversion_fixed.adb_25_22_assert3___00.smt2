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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const x2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const x3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const x4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-sort t 0)

(define-fun in_range1 ((x1 Int)) Bool (and (<= (- 25) x1) (<= x1 25)))

(declare-const dummy t)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (t t) Bool)

(declare-datatypes () ((t__ref (t__refqtmk (t__content t)))))
(define-fun t__ref_t__content__projection ((a t__ref)) t (t__content a))

(define-fun dynamic_invariant ((temp___expr_158 Int)
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool)
  (temp___do_typ_inv_157 Bool)) Bool (=>
                                     (or (= temp___is_init_154 true)
                                     (<= (- 25) 25)) (in_range1
                                     temp___expr_158)))

(declare-sort t2 0)

(define-fun in_range2 ((x5 Int)) Bool (and (<= (- 250) x5) (<= x5 250)))

(declare-const dummy1 t2)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (t2 t2) Bool)

(declare-datatypes () ((t2__ref (t2__refqtmk (t2__content t2)))))
(define-fun t2__ref_t2__content__projection ((a t2__ref)) t2 (t2__content a))

(define-fun dynamic_invariant1 ((temp___expr_165 Int)
  (temp___is_init_161 Bool) (temp___skip_constant_162 Bool)
  (temp___do_toplevel_163 Bool)
  (temp___do_typ_inv_164 Bool)) Bool (=>
                                     (or (= temp___is_init_161 true)
                                     (<= (- 250) 250)) (in_range2
                                     temp___expr_165)))

(declare-sort t3 0)

(define-fun in_range3 ((x5 Int)) Bool (and (<= (- 10) x5) (<= x5 10)))

(declare-const dummy2 t3)

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (t3 t3) Bool)

(declare-datatypes () ((t3__ref (t3__refqtmk (t3__content t3)))))
(define-fun t3__ref_t3__content__projection ((a t3__ref)) t3 (t3__content a))

(define-fun dynamic_invariant2 ((temp___expr_172 Int)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (=>
                                     (or (= temp___is_init_168 true)
                                     (<= (- 10) 10)) (in_range3
                                     temp___expr_172)))

(declare-sort t4 0)

(define-fun in_range4 ((x5 Int)) Bool (and (<= (- 5) x5) (<= x5 5)))

(declare-const dummy3 t4)

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (t4 t4) Bool)

(declare-datatypes () ((t4__ref (t4__refqtmk (t4__content t4)))))
(define-fun t4__ref_t4__content__projection ((a t4__ref)) t4 (t4__content a))

(define-fun dynamic_invariant3 ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (<= (- 5) 5)) (in_range4
                                     temp___expr_179)))

(define-fun abs1 ((x5 Int)) Int (ite (<= 0 x5) x5 (- x5)))

;; Abs_le
  (assert
  (forall ((x5 Int) (y Int))
  (= (<= (abs1 x5) y) (and (<= (- y) x5) (<= x5 y)))))

;; Abs_pos
  (assert (forall ((x5 Int)) (<= 0 (abs1 x5))))

(declare-fun div1 (Int Int) Int)

(declare-fun mod1 (Int Int) Int)

;; Div_mod
  (assert
  (forall ((x5 Int) (y Int))
  (=> (not (= y 0)) (= x5 (+ (* y (div1 x5 y)) (mod1 x5 y))))))

;; Div_bound
  (assert
  (forall ((x5 Int) (y Int))
  (=> (and (<= 0 x5) (< 0 y)) (and (<= 0 (div1 x5 y)) (<= (div1 x5 y) x5)))))

;; Mod_bound
  (assert
  (forall ((x5 Int) (y Int))
  (=> (not (= y 0))
  (and (< (- (abs1 y)) (mod1 x5 y)) (< (mod1 x5 y) (abs1 y))))))

;; Div_sign_pos
  (assert
  (forall ((x5 Int) (y Int)) (=> (and (<= 0 x5) (< 0 y)) (<= 0 (div1 x5 y)))))

;; Div_sign_neg
  (assert
  (forall ((x5 Int) (y Int)) (=> (and (<= x5 0) (< 0 y)) (<= (div1 x5 y) 0))))

;; Mod_sign_pos
  (assert
  (forall ((x5 Int) (y Int))
  (=> (and (<= 0 x5) (not (= y 0))) (<= 0 (mod1 x5 y)))))

;; Mod_sign_neg
  (assert
  (forall ((x5 Int) (y Int))
  (=> (and (<= x5 0) (not (= y 0))) (<= (mod1 x5 y) 0))))

;; Rounds_toward_zero
  (assert
  (forall ((x5 Int) (y Int))
  (=> (not (= y 0)) (<= (abs1 (* (div1 x5 y) y)) (abs1 x5)))))

;; Div_1
  (assert (forall ((x5 Int)) (= (div1 x5 1) x5)))

;; Mod_1
  (assert (forall ((x5 Int)) (= (mod1 x5 1) 0)))

;; Div_inf
  (assert
  (forall ((x5 Int) (y Int)) (=> (and (<= 0 x5) (< x5 y)) (= (div1 x5 y) 0))))

;; Mod_inf
  (assert
  (forall ((x5 Int) (y Int))
  (=> (and (<= 0 x5) (< x5 y)) (= (mod1 x5 y) x5))))

;; Div_mult
  (assert
  (forall ((x5 Int) (y Int) (z Int))
  (! (=> (and (< 0 x5) (and (<= 0 y) (<= 0 z)))
     (= (div1 (+ (* x5 y) z) x5) (+ y (div1 z x5)))) :pattern ((div1
                                                               (+ (* x5 y) z)
                                                               x5)) )))

;; Mod_mult
  (assert
  (forall ((x5 Int) (y Int) (z Int))
  (! (=> (and (< 0 x5) (and (<= 0 y) (<= 0 z)))
     (= (mod1 (+ (* x5 y) z) x5) (mod1 z x5))) :pattern ((mod1 (+ (* x5 y) z)
                                                         x5)) )))

(define-fun mod2 ((x5 Int)
  (y Int)) Int (ite (< 0 y) (mod x5 y) (+ (mod x5 y) y)))

(define-fun pos_div_relation ((res Int) (num Int)
  (den Int)) Bool (let ((exact (div1 num den)))
                  (ite (= num 0) (= res 0)
                  (ite (= num (* exact den)) (= res exact)
                  (and (<= exact res) (<= res (+ exact 1)))))))

(declare-fun fxp_mult (Int Int) Int)

;; fxp_mult_def
  (assert
  (forall ((x5 Int))
  (forall ((y Int))
  (! (ite (or (= x5 0) (= y 0)) (= (fxp_mult x5 y) 0)
     (ite (or (and (< 0 x5) (< 0 y)) (and (< x5 0) (< y 0)))
     (pos_div_relation (fxp_mult x5 y) (* (* (* (* x5 y) 2) 1) 5)
     (* (* 1 1) 2)) (pos_div_relation (- (fxp_mult x5 y))
     (- (* (* (* (* x5 y) 2) 1) 5)) (* (* 1 1) 2)))) :pattern ((fxp_mult x5
                                                               y)) ))))

(declare-fun fxp_div (Int Int) Int)

;; fxp_div_def
  (assert
  (forall ((x5 Int))
  (forall ((y Int))
  (! (ite (= x5 0) (= (fxp_div x5 y) 0)
     (ite (and (< 0 x5) (< 0 y)) (pos_div_relation (fxp_div x5 y)
     (* (* (* x5 2) 1) 5) (* (* (* y 1) 1) 2))
     (ite (and (< x5 0) (< y 0)) (pos_div_relation (fxp_div x5 y)
     (* (* (* (- x5) 2) 1) 5) (* (* (* (- y) 1) 1) 2))
     (ite (and (< x5 0) (< 0 y)) (pos_div_relation (- (fxp_div x5 y))
     (* (* (* (- x5) 2) 1) 5) (* (* (* y 1) 1) 2))
     (=> (and (< 0 x5) (< y 0)) (pos_div_relation (- (fxp_div x5 y))
     (* (* (* x5 2) 1) 5) (* (* (* (- y) 1) 1) 2))))))) :pattern ((fxp_div x5
                                                                  y)) ))))

(declare-fun fxp_mult1 (Int Int) Int)

;; fxp_mult_def
  (assert
  (forall ((x5 Int))
  (forall ((y Int))
  (! (ite (or (= x5 0) (= y 0)) (= (fxp_mult1 x5 y) 0)
     (ite (or (and (< 0 x5) (< 0 y)) (and (< x5 0) (< y 0)))
     (pos_div_relation (fxp_mult1 x5 y) (* (* (* (* x5 y) 1) 1) 25)
     (* (* 1 1) 1)) (pos_div_relation (- (fxp_mult1 x5 y))
     (- (* (* (* (* x5 y) 1) 1) 25)) (* (* 1 1) 1)))) :pattern ((fxp_mult1 x5
                                                                y)) ))))

(declare-fun fxp_div1 (Int Int) Int)

;; fxp_div_def
  (assert
  (forall ((x5 Int))
  (forall ((y Int))
  (! (ite (= x5 0) (= (fxp_div1 x5 y) 0)
     (ite (and (< 0 x5) (< 0 y)) (pos_div_relation (fxp_div1 x5 y)
     (* (* (* x5 1) 1) 25) (* (* (* y 1) 1) 1))
     (ite (and (< x5 0) (< y 0)) (pos_div_relation (fxp_div1 x5 y)
     (* (* (* (- x5) 1) 1) 25) (* (* (* (- y) 1) 1) 1))
     (ite (and (< x5 0) (< 0 y)) (pos_div_relation (- (fxp_div1 x5 y))
     (* (* (* (- x5) 1) 1) 25) (* (* (* y 1) 1) 1))
     (=> (and (< 0 x5) (< y 0)) (pos_div_relation (- (fxp_div1 x5 y))
     (* (* (* x5 1) 1) 25) (* (* (* (- y) 1) 1) 1))))))) :pattern ((fxp_div1
                                                                   x5 y)) ))))

(declare-fun fxp_mult2 (Int Int) Int)

;; fxp_mult_def
  (assert
  (forall ((x5 Int))
  (forall ((y Int))
  (! (ite (or (= x5 0) (= y 0)) (= (fxp_mult2 x5 y) 0)
     (ite (or (and (< 0 x5) (< 0 y)) (and (< x5 0) (< y 0)))
     (pos_div_relation (fxp_mult2 x5 y) (* (* (* (* x5 y) 1) 1) 1)
     (* (* 25 1) 1)) (pos_div_relation (- (fxp_mult2 x5 y))
     (- (* (* (* (* x5 y) 1) 1) 1)) (* (* 25 1) 1)))) :pattern ((fxp_mult2 x5
                                                                y)) ))))

(declare-fun fxp_div2 (Int Int) Int)

;; fxp_div_def
  (assert
  (forall ((x5 Int))
  (forall ((y Int))
  (! (ite (= x5 0) (= (fxp_div2 x5 y) 0)
     (ite (and (< 0 x5) (< 0 y)) (pos_div_relation (fxp_div2 x5 y)
     (* (* (* x5 1) 1) 1) (* (* (* y 25) 1) 1))
     (ite (and (< x5 0) (< y 0)) (pos_div_relation (fxp_div2 x5 y)
     (* (* (* (- x5) 1) 1) 1) (* (* (* (- y) 25) 1) 1))
     (ite (and (< x5 0) (< 0 y)) (pos_div_relation (- (fxp_div2 x5 y))
     (* (* (* (- x5) 1) 1) 1) (* (* (* y 25) 1) 1))
     (=> (and (< 0 x5) (< y 0)) (pos_div_relation (- (fxp_div2 x5 y))
     (* (* (* x5 1) 1) 1) (* (* (* (- y) 25) 1) 1))))))) :pattern ((fxp_div2
                                                                   x5 y)) ))))

(declare-fun fxp_mult3 (Int Int) Int)

;; fxp_mult_def
  (assert
  (forall ((x5 Int))
  (forall ((y Int))
  (! (ite (or (= x5 0) (= y 0)) (= (fxp_mult3 x5 y) 0)
     (ite (or (and (< 0 x5) (< 0 y)) (and (< x5 0) (< y 0)))
     (pos_div_relation (fxp_mult3 x5 y) (* (* (* (* x5 y) 2) 1) 1)
     (* (* 1 1) 1)) (pos_div_relation (- (fxp_mult3 x5 y))
     (- (* (* (* (* x5 y) 2) 1) 1)) (* (* 1 1) 1)))) :pattern ((fxp_mult3 x5
                                                               y)) ))))

(declare-fun fxp_div3 (Int Int) Int)

;; fxp_div_def
  (assert
  (forall ((x5 Int))
  (forall ((y Int))
  (! (ite (= x5 0) (= (fxp_div3 x5 y) 0)
     (ite (and (< 0 x5) (< 0 y)) (pos_div_relation (fxp_div3 x5 y)
     (* (* (* x5 2) 1) 1) (* (* (* y 1) 1) 1))
     (ite (and (< x5 0) (< y 0)) (pos_div_relation (fxp_div3 x5 y)
     (* (* (* (- x5) 2) 1) 1) (* (* (* (- y) 1) 1) 1))
     (ite (and (< x5 0) (< 0 y)) (pos_div_relation (- (fxp_div3 x5 y))
     (* (* (* (- x5) 2) 1) 1) (* (* (* y 1) 1) 1))
     (=> (and (< 0 x5) (< y 0)) (pos_div_relation (- (fxp_div3 x5 y))
     (* (* (* x5 2) 1) 1) (* (* (* (- y) 1) 1) 1))))))) :pattern ((fxp_div3
                                                                  x5 y)) ))))

(declare-fun fxp_mult4 (Int Int) Int)

;; fxp_mult_def
  (assert
  (forall ((x5 Int))
  (forall ((y Int))
  (! (ite (or (= x5 0) (= y 0)) (= (fxp_mult4 x5 y) 0)
     (ite (or (and (< 0 x5) (< 0 y)) (and (< x5 0) (< y 0)))
     (pos_div_relation (fxp_mult4 x5 y) (* (* (* (* x5 y) 2) 1) 1)
     (* (* 5 1) 2)) (pos_div_relation (- (fxp_mult4 x5 y))
     (- (* (* (* (* x5 y) 2) 1) 1)) (* (* 5 1) 2)))) :pattern ((fxp_mult4 x5
                                                               y)) ))))

(declare-fun fxp_div4 (Int Int) Int)

;; fxp_div_def
  (assert
  (forall ((x5 Int))
  (forall ((y Int))
  (! (ite (= x5 0) (= (fxp_div4 x5 y) 0)
     (ite (and (< 0 x5) (< 0 y)) (pos_div_relation (fxp_div4 x5 y)
     (* (* (* x5 2) 1) 1) (* (* (* y 5) 1) 2))
     (ite (and (< x5 0) (< y 0)) (pos_div_relation (fxp_div4 x5 y)
     (* (* (* (- x5) 2) 1) 1) (* (* (* (- y) 5) 1) 2))
     (ite (and (< x5 0) (< 0 y)) (pos_div_relation (- (fxp_div4 x5 y))
     (* (* (* (- x5) 2) 1) 1) (* (* (* y 5) 1) 2))
     (=> (and (< 0 x5) (< y 0)) (pos_div_relation (- (fxp_div4 x5 y))
     (* (* (* x5 2) 1) 1) (* (* (* (- y) 5) 1) 2))))))) :pattern ((fxp_div4
                                                                  x5 y)) ))))

(declare-fun fxp_mult5 (Int Int) Int)

;; fxp_mult_def
  (assert
  (forall ((x5 Int))
  (forall ((y Int))
  (! (ite (or (= x5 0) (= y 0)) (= (fxp_mult5 x5 y) 0)
     (ite (or (and (< 0 x5) (< 0 y)) (and (< x5 0) (< y 0)))
     (pos_div_relation (fxp_mult5 x5 y) (* (* (* (* x5 y) 1) 1) 1)
     (* (* 1 1) 2)) (pos_div_relation (- (fxp_mult5 x5 y))
     (- (* (* (* (* x5 y) 1) 1) 1)) (* (* 1 1) 2)))) :pattern ((fxp_mult5 x5
                                                               y)) ))))

(declare-fun fxp_div5 (Int Int) Int)

;; fxp_div_def
  (assert
  (forall ((x5 Int))
  (forall ((y Int))
  (! (ite (= x5 0) (= (fxp_div5 x5 y) 0)
     (ite (and (< 0 x5) (< 0 y)) (pos_div_relation (fxp_div5 x5 y)
     (* (* (* x5 1) 1) 1) (* (* (* y 1) 1) 2))
     (ite (and (< x5 0) (< y 0)) (pos_div_relation (fxp_div5 x5 y)
     (* (* (* (- x5) 1) 1) 1) (* (* (* (- y) 1) 1) 2))
     (ite (and (< x5 0) (< 0 y)) (pos_div_relation (- (fxp_div5 x5 y))
     (* (* (* (- x5) 1) 1) 1) (* (* (* y 1) 1) 2))
     (=> (and (< 0 x5) (< y 0)) (pos_div_relation (- (fxp_div5 x5 y))
     (* (* (* x5 1) 1) 1) (* (* (* (- y) 1) 1) 2))))))) :pattern ((fxp_div5
                                                                  x5 y)) ))))

(declare-const y Int)

(declare-const y2 Int)

(declare-const y3 Int)

(declare-const y4 Int)

;; Assume
  (assert (dynamic_invariant x true false true true))

;; Assume
  (assert (dynamic_invariant1 x2 true false true true))

;; Assume
  (assert (dynamic_invariant2 x3 true false true true))

;; Assume
  (assert (dynamic_invariant3 x4 true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant y false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 y2 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant2 y3 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant3 y4 false false true true))

(declare-const y1 Int)

;; H
  (assert (= y1 (fxp_mult x4 1)))

;; Assert
  (assert (=> (= x4 (- 5)) (= y1 (- 25))))

;; Assert
  (assert (=> (= x4 1) (= y1 5)))

;; Assert
  (assert (=> (= x4 2) (= y1 10)))

(declare-const y21 Int)

;; H
  (assert (= y21 (fxp_mult1 x3 1)))

;; Assert
  (assert (=> (= x3 (- 10)) (= y21 (- 250))))

;; Assert
  (assert (=> (= x3 2) (= y21 50)))

;; Assert
  (assert (=> (= x3 4) (= y21 100)))

(declare-const y31 Int)

;; H
  (assert (= y31 (fxp_mult2 x2 1)))

;; Assert
  (assert (=> (= x2 (- 250)) (= y31 (- 10))))

;; Assert
  (assert (=> (= x2 50) (= y31 2)))

;; Assert
  (assert (=> (= x2 100) (= y31 4)))

(declare-const y32 Int)

;; H
  (assert (= y32 (fxp_mult3 x4 1)))

;; H
  (assert (= x4 (- 5)))

(assert
;; defqtvc
 ;; File "conversion_fixed.ads", line 8, characters 0-0
  (not (= y32 (- 10))))
(check-sat)
