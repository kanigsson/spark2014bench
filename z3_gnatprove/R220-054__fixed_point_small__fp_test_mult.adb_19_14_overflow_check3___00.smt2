;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
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

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const y Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort tfp1B 0)

(define-fun in_range1 ((x1 Int)) Bool (and (<= (- 128) x1) (<= x1 127)))

(declare-const dummy tfp1B)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (tfp1B tfp1B) Bool)

(declare-datatypes () ((tfp1B__ref (tfp1B__refqtmk (tfp1B__content tfp1B)))))
(define-fun tfp1B__ref_tfp1B__content__projection ((a tfp1B__ref)) tfp1B 
  (tfp1B__content a))

(declare-sort fp1 0)

(define-fun in_range2 ((x1 Int)) Bool (and (<= (- 30) x1) (<= x1 30)))

(declare-const dummy1 fp1)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (fp1 fp1) Bool)

(declare-datatypes () ((fp1__ref (fp1__refqtmk (fp1__content fp1)))))
(define-fun fp1__ref_fp1__content__projection ((a fp1__ref)) fp1 (fp1__content
                                                                 a))

(define-fun dynamic_invariant ((temp___expr_158 Int)
  (temp___is_init_154 Bool) (temp___skip_constant_155 Bool)
  (temp___do_toplevel_156 Bool)
  (temp___do_typ_inv_157 Bool)) Bool (=>
                                     (or (= temp___is_init_154 true)
                                     (<= (- 30) 30)) (in_range2
                                     temp___expr_158)))

(declare-sort tfp2B 0)

(define-fun in_range3 ((x1 Int)) Bool (and (<= (- 128) x1) (<= x1 127)))

(declare-const dummy2 tfp2B)

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (tfp2B tfp2B) Bool)

(declare-datatypes () ((tfp2B__ref (tfp2B__refqtmk (tfp2B__content tfp2B)))))
(define-fun tfp2B__ref_tfp2B__content__projection ((a tfp2B__ref)) tfp2B 
  (tfp2B__content a))

(declare-sort fp2 0)

(define-fun in_range4 ((x1 Int)) Bool (and (<= (- 50) x1) (<= x1 50)))

(declare-const dummy3 fp2)

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (fp2 fp2) Bool)

(declare-datatypes () ((fp2__ref (fp2__refqtmk (fp2__content fp2)))))
(define-fun fp2__ref_fp2__content__projection ((a fp2__ref)) fp2 (fp2__content
                                                                 a))

(define-fun dynamic_invariant1 ((temp___expr_165 Int)
  (temp___is_init_161 Bool) (temp___skip_constant_162 Bool)
  (temp___do_toplevel_163 Bool)
  (temp___do_typ_inv_164 Bool)) Bool (=>
                                     (or (= temp___is_init_161 true)
                                     (<= (- 50) 50)) (in_range4
                                     temp___expr_165)))

(declare-sort tfp3B 0)

(define-fun in_range5 ((x1 Int)) Bool (and (<= (- 32768) x1) (<= x1 32767)))

(declare-const dummy4 tfp3B)

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq4 (tfp3B tfp3B) Bool)

(declare-datatypes () ((tfp3B__ref (tfp3B__refqtmk (tfp3B__content tfp3B)))))
(define-fun tfp3B__ref_tfp3B__content__projection ((a tfp3B__ref)) tfp3B 
  (tfp3B__content a))

(declare-sort fp3 0)

(define-fun in_range6 ((x1 Int)) Bool (and (<= (- 150) x1) (<= x1 150)))

(declare-const dummy5 fp3)

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq5 (fp3 fp3) Bool)

(declare-datatypes () ((fp3__ref (fp3__refqtmk (fp3__content fp3)))))
(define-fun fp3__ref_fp3__content__projection ((a fp3__ref)) fp3 (fp3__content
                                                                 a))

(define-fun dynamic_invariant2 ((temp___expr_172 Int)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (=>
                                     (or (= temp___is_init_168 true)
                                     (<= (- 150) 150)) (in_range6
                                     temp___expr_172)))

(declare-sort tfp4B 0)

(define-fun in_range7 ((x1 Int)) Bool (and (<= (- 32768) x1) (<= x1 32767)))

(declare-const dummy6 tfp4B)

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq6 (tfp4B tfp4B) Bool)

(declare-datatypes () ((tfp4B__ref (tfp4B__refqtmk (tfp4B__content tfp4B)))))
(define-fun tfp4B__ref_tfp4B__content__projection ((a tfp4B__ref)) tfp4B 
  (tfp4B__content a))

(declare-sort fp4 0)

(define-fun in_range8 ((x1 Int)) Bool (and (<= (- 300) x1) (<= x1 300)))

(declare-const dummy7 fp4)

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq7 (fp4 fp4) Bool)

(declare-datatypes () ((fp4__ref (fp4__refqtmk (fp4__content fp4)))))
(define-fun fp4__ref_fp4__content__projection ((a fp4__ref)) fp4 (fp4__content
                                                                 a))

(define-fun dynamic_invariant3 ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (<= (- 300) 300)) (in_range8
                                     temp___expr_179)))

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
     (pos_div_relation (fxp_mult x1 y1) (* (* (* (* x1 y1) 1) 1) 15)
     (* (* 3 5) 1)) (pos_div_relation (- (fxp_mult x1 y1))
     (- (* (* (* (* x1 y1) 1) 1) 15)) (* (* 3 5) 1)))) :pattern ((fxp_mult x1
                                                                 y1)) ))))

(declare-fun fxp_div (Int Int) Int)

;; fxp_div_def
  (assert
  (forall ((x1 Int))
  (forall ((y1 Int))
  (! (ite (= x1 0) (= (fxp_div x1 y1) 0)
     (ite (and (< 0 x1) (< 0 y1)) (pos_div_relation (fxp_div x1 y1)
     (* (* (* x1 1) 5) 15) (* (* (* y1 3) 1) 1))
     (ite (and (< x1 0) (< y1 0)) (pos_div_relation (fxp_div x1 y1)
     (* (* (* (- x1) 1) 5) 15) (* (* (* (- y1) 3) 1) 1))
     (ite (and (< x1 0) (< 0 y1)) (pos_div_relation (- (fxp_div x1 y1))
     (* (* (* (- x1) 1) 5) 15) (* (* (* y1 3) 1) 1))
     (=> (and (< 0 x1) (< y1 0)) (pos_div_relation (- (fxp_div x1 y1))
     (* (* (* x1 1) 5) 15) (* (* (* (- y1) 3) 1) 1))))))) :pattern ((fxp_div
                                                                    x1 y1)) ))))

(declare-fun fxp_mult1 (Int Int) Int)

;; fxp_mult_def
  (assert
  (forall ((x1 Int))
  (forall ((y1 Int))
  (! (ite (or (= x1 0) (= y1 0)) (= (fxp_mult1 x1 y1) 0)
     (ite (or (and (< 0 x1) (< 0 y1)) (and (< x1 0) (< y1 0)))
     (pos_div_relation (fxp_mult1 x1 y1) (* (* (* (* x1 y1) 1) 1) 30)
     (* (* 3 5) 1)) (pos_div_relation (- (fxp_mult1 x1 y1))
     (- (* (* (* (* x1 y1) 1) 1) 30)) (* (* 3 5) 1)))) :pattern ((fxp_mult1
                                                                 x1 y1)) ))))

(declare-fun fxp_div1 (Int Int) Int)

;; fxp_div_def
  (assert
  (forall ((x1 Int))
  (forall ((y1 Int))
  (! (ite (= x1 0) (= (fxp_div1 x1 y1) 0)
     (ite (and (< 0 x1) (< 0 y1)) (pos_div_relation (fxp_div1 x1 y1)
     (* (* (* x1 1) 5) 30) (* (* (* y1 3) 1) 1))
     (ite (and (< x1 0) (< y1 0)) (pos_div_relation (fxp_div1 x1 y1)
     (* (* (* (- x1) 1) 5) 30) (* (* (* (- y1) 3) 1) 1))
     (ite (and (< x1 0) (< 0 y1)) (pos_div_relation (- (fxp_div1 x1 y1))
     (* (* (* (- x1) 1) 5) 30) (* (* (* y1 3) 1) 1))
     (=> (and (< 0 x1) (< y1 0)) (pos_div_relation (- (fxp_div1 x1 y1))
     (* (* (* x1 1) 5) 30) (* (* (* (- y1) 3) 1) 1))))))) :pattern ((fxp_div1
                                                                    x1 y1)) ))))

(declare-const u Int)

(declare-const v Int)

;; Assume
  (assert (dynamic_invariant x true false true true))

;; Assume
  (assert (dynamic_invariant1 y true false true true))

;; Assume
  (assert (dynamic_invariant2 u false false true true))

;; Assume
  (assert (dynamic_invariant3 v false false true true))

;; Assume
  (assert (and (<= (abs1 x) 6) (<= (abs1 y) 20)))

(define-fun o () Int (fxp_mult x y))

(declare-const u1 Int)

;; H
  (assert (= u1 o))

(define-fun o1 () Int (fxp_mult1 x y))

(assert
;; defqtvc
 ;; File "fp_test_mult.ads", line 15, characters 0-0
  (not (in_range7 o1)))
(check-sat)