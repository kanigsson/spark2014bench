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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun double1 (Int) Int)

(declare-fun double1__function_guard (Int Int) Bool)

(declare-sort t 0)

(declare-fun tqtint (t) Int)

;; t'axiom
  (assert
  (forall ((i t))
  (and (<= (- 2147483648) (tqtint i)) (<= (tqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (t t) Bool)

(declare-const dummy1 t)

(declare-datatypes () ((t__ref (t__refqtmk (t__content t)))))
(define-fun t__ref_t__content__projection ((a t__ref)) t (t__content a))

(define-fun dynamic_invariant1 ((temp___expr_180 Int)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (=>
                                     (or (= temp___is_init_176 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range1 temp___expr_180)))

;; double1__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant1 x true true true true)
     (let ((result (double1 x)))
     (=> (double1__function_guard result x) (dynamic_invariant1 result true
     false true true)))) :pattern ((double1 x)) )))

(declare-fun double2 (Int) Int)

(declare-fun double2__function_guard (Int Int) Bool)

(declare-sort t1 0)

(declare-fun tqtint1 (t1) Int)

;; t'axiom
  (assert
  (forall ((i t1))
  (and (<= (- 2147483648) (tqtint1 i)) (<= (tqtint1 i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (t1 t1) Bool)

(declare-const dummy2 t1)

(declare-datatypes () ((t__ref1 (t__refqtmk1 (t__content1 t1)))))
(define-fun t__ref_t__content__2__projection ((a t__ref1)) t1 (t__content1 a))

(define-fun dynamic_invariant2 ((temp___expr_187 Int)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=>
                                     (or (= temp___is_init_183 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range2 temp___expr_187)))

;; double2__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant2 x true true true true)
     (let ((result (double2 x)))
     (=> (double2__function_guard result x) (dynamic_invariant2 result true
     false true true)))) :pattern ((double2 x)) )))

(declare-fun ten1 (Int) Int)

(declare-fun ten1__function_guard (Int Int) Bool)

(declare-sort t2 0)

(declare-fun tqtint2 (t2) Int)

;; t'axiom
  (assert (forall ((i t2)) (and (<= 1 (tqtint2 i)) (<= (tqtint2 i) 10))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (t2 t2) Bool)

(declare-const dummy3 t2)

(declare-datatypes () ((t__ref2 (t__refqtmk2 (t__content2 t2)))))
(define-fun t__ref_t__content__3__projection ((a t__ref2)) t2 (t__content2 a))

(define-fun dynamic_invariant3 ((temp___expr_194 Int)
  (temp___is_init_190 Bool) (temp___skip_constant_191 Bool)
  (temp___do_toplevel_192 Bool)
  (temp___do_typ_inv_193 Bool)) Bool (=>
                                     (or (= temp___is_init_190 true)
                                     (<= 1 10)) (in_range3 temp___expr_194)))

;; ten1__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant3 x true true true true)
     (let ((result (ten1 x)))
     (=> (ten1__function_guard result x) (dynamic_invariant3 result true
     false true true)))) :pattern ((ten1 x)) )))

(declare-fun ten2 (Int) Int)

(declare-fun ten2__function_guard (Int Int) Bool)

(declare-sort t3 0)

(declare-fun tqtint3 (t3) Int)

;; t'axiom
  (assert (forall ((i t3)) (and (<= 1 (tqtint3 i)) (<= (tqtint3 i) 10))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (t3 t3) Bool)

(declare-const dummy4 t3)

(declare-datatypes () ((t__ref3 (t__refqtmk3 (t__content3 t3)))))
(define-fun t__ref_t__content__4__projection ((a t__ref3)) t3 (t__content3 a))

(define-fun dynamic_invariant4 ((temp___expr_201 Int)
  (temp___is_init_197 Bool) (temp___skip_constant_198 Bool)
  (temp___do_toplevel_199 Bool)
  (temp___do_typ_inv_200 Bool)) Bool (=>
                                     (or (= temp___is_init_197 true)
                                     (<= 1 10)) (in_range4 temp___expr_201)))

;; ten2__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant4 x true true true true)
     (let ((result (ten2 x)))
     (=> (ten2__function_guard result x) (dynamic_invariant4 result true
     false true true)))) :pattern ((ten2 x)) )))

(declare-fun false1 (Int) Bool)

(declare-fun false1__function_guard (Bool Int) Bool)

(declare-sort t4 0)

(declare-fun tqtint4 (t4) Int)

;; t'axiom
  (assert
  (forall ((i t4))
  (and (<= (- 2147483648) (tqtint4 i)) (<= (tqtint4 i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (t4 t4) Bool)

(declare-const dummy5 t4)

(declare-datatypes () ((t__ref4 (t__refqtmk4 (t__content4 t4)))))
(define-fun t__ref_t__content__5__projection ((a t__ref4)) t4 (t__content4 a))

(define-fun dynamic_invariant5 ((temp___expr_208 Int)
  (temp___is_init_204 Bool) (temp___skip_constant_205 Bool)
  (temp___do_toplevel_206 Bool)
  (temp___do_typ_inv_207 Bool)) Bool (=>
                                     (or (= temp___is_init_204 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range5 temp___expr_208)))

;; false1__post_axiom
  (assert true)

(declare-fun false2 (Int) Bool)

(declare-fun false2__function_guard (Bool Int) Bool)

(declare-sort t5 0)

(declare-fun tqtint5 (t5) Int)

;; t'axiom
  (assert
  (forall ((i t5))
  (and (<= (- 2147483648) (tqtint5 i)) (<= (tqtint5 i) 2147483647))))

(define-fun in_range6 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (t5 t5) Bool)

(declare-const dummy6 t5)

(declare-datatypes () ((t__ref5 (t__refqtmk5 (t__content5 t5)))))
(define-fun t__ref_t__content__6__projection ((a t__ref5)) t5 (t__content5 a))

(define-fun dynamic_invariant6 ((temp___expr_215 Int)
  (temp___is_init_211 Bool) (temp___skip_constant_212 Bool)
  (temp___do_toplevel_213 Bool)
  (temp___do_typ_inv_214 Bool)) Bool (=>
                                     (or (= temp___is_init_211 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range6 temp___expr_215)))

;; false2__post_axiom
  (assert true)

(declare-fun fixed_true1 (Int) Bool)

(declare-fun fixed_true1__function_guard (Bool Int) Bool)

(declare-sort t6 0)

(declare-fun tqtint6 (t6) Int)

;; t'axiom
  (assert (forall ((i t6)) (and (<= 1 (tqtint6 i)) (<= (tqtint6 i) 10))))

(define-fun in_range7 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq7 (t6 t6) Bool)

(declare-const dummy7 t6)

(declare-datatypes () ((t__ref6 (t__refqtmk6 (t__content6 t6)))))
(define-fun t__ref_t__content__7__projection ((a t__ref6)) t6 (t__content6 a))

(define-fun dynamic_invariant7 ((temp___expr_222 Int)
  (temp___is_init_218 Bool) (temp___skip_constant_219 Bool)
  (temp___do_toplevel_220 Bool)
  (temp___do_typ_inv_221 Bool)) Bool (=>
                                     (or (= temp___is_init_218 true)
                                     (<= 1 10)) (in_range7 temp___expr_222)))

;; fixed_true1__post_axiom
  (assert true)

(declare-fun fixed_true2 (Int) Bool)

(declare-fun fixed_true2__function_guard (Bool Int) Bool)

(declare-sort t7 0)

(declare-fun tqtint7 (t7) Int)

;; t'axiom
  (assert (forall ((i t7)) (and (<= 1 (tqtint7 i)) (<= (tqtint7 i) 10))))

(define-fun in_range8 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq8 (t7 t7) Bool)

(declare-const dummy8 t7)

(declare-datatypes () ((t__ref7 (t__refqtmk7 (t__content7 t7)))))
(define-fun t__ref_t__content__8__projection ((a t__ref7)) t7 (t__content7 a))

(define-fun dynamic_invariant8 ((temp___expr_229 Int)
  (temp___is_init_225 Bool) (temp___skip_constant_226 Bool)
  (temp___do_toplevel_227 Bool)
  (temp___do_typ_inv_228 Bool)) Bool (=>
                                     (or (= temp___is_init_225 true)
                                     (<= 1 10)) (in_range8 temp___expr_229)))

;; fixed_true2__post_axiom
  (assert true)

(declare-fun true1R (Int) Bool)

(declare-fun true1R__function_guard (Bool Int) Bool)

(declare-sort t8 0)

(declare-fun tqtint8 (t8) Int)

;; t'axiom
  (assert
  (forall ((i t8))
  (and (<= (- 2147483648) (tqtint8 i)) (<= (tqtint8 i) 2147483647))))

(define-fun in_range9 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE9 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check9 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE9 (us_image) Int)

(declare-fun user_eq9 (t8 t8) Bool)

(declare-const dummy9 t8)

(declare-datatypes () ((t__ref8 (t__refqtmk8 (t__content8 t8)))))
(define-fun t__ref_t__content__9__projection ((a t__ref8)) t8 (t__content8 a))

(define-fun dynamic_invariant9 ((temp___expr_236 Int)
  (temp___is_init_232 Bool) (temp___skip_constant_233 Bool)
  (temp___do_toplevel_234 Bool)
  (temp___do_typ_inv_235 Bool)) Bool (=>
                                     (or (= temp___is_init_232 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range9 temp___expr_236)))

;; true1R__post_axiom
  (assert true)

(declare-fun true2R (Int) Bool)

(declare-fun true2R__function_guard (Bool Int) Bool)

(declare-sort t9 0)

(declare-fun tqtint9 (t9) Int)

;; t'axiom
  (assert
  (forall ((i t9))
  (and (<= (- 2147483648) (tqtint9 i)) (<= (tqtint9 i) 2147483647))))

(define-fun in_range10 ((x Int)) Bool (and (<= (- 2147483648) x)
                                      (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE10 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check10 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE10 (us_image) Int)

(declare-fun user_eq10 (t9 t9) Bool)

(declare-const dummy10 t9)

(declare-datatypes () ((t__ref9 (t__refqtmk9 (t__content9 t9)))))
(define-fun t__ref_t__content__10__projection ((a t__ref9)) t9 (t__content9
                                                               a))

(define-fun dynamic_invariant10 ((temp___expr_243 Int)
  (temp___is_init_239 Bool) (temp___skip_constant_240 Bool)
  (temp___do_toplevel_241 Bool)
  (temp___do_typ_inv_242 Bool)) Bool (=>
                                     (or (= temp___is_init_239 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range10 temp___expr_243)))

;; true2R__post_axiom
  (assert true)

(declare-fun fixed_false1R (Int) Bool)

(declare-fun fixed_false1R__function_guard (Bool Int) Bool)

(declare-sort t10 0)

(declare-fun tqtint10 (t10) Int)

;; t'axiom
  (assert (forall ((i t10)) (and (<= 1 (tqtint10 i)) (<= (tqtint10 i) 10))))

(define-fun in_range11 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE11 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check11 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE11 (us_image) Int)

(declare-fun user_eq11 (t10 t10) Bool)

(declare-const dummy11 t10)

(declare-datatypes () ((t__ref10 (t__refqtmk10 (t__content10 t10)))))
(define-fun t__ref_t__content__11__projection ((a t__ref10)) t10 (t__content10
                                                                 a))

(define-fun dynamic_invariant11 ((temp___expr_250 Int)
  (temp___is_init_246 Bool) (temp___skip_constant_247 Bool)
  (temp___do_toplevel_248 Bool)
  (temp___do_typ_inv_249 Bool)) Bool (=>
                                     (or (= temp___is_init_246 true)
                                     (<= 1 10)) (in_range11 temp___expr_250)))

;; fixed_false1R__post_axiom
  (assert true)

(declare-fun fixed_false2R (Int) Bool)

(declare-fun fixed_false2R__function_guard (Bool Int) Bool)

(declare-sort t11 0)

(declare-fun tqtint11 (t11) Int)

;; t'axiom
  (assert (forall ((i t11)) (and (<= 1 (tqtint11 i)) (<= (tqtint11 i) 10))))

(define-fun in_range12 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE12 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check12 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE12 (us_image) Int)

(declare-fun user_eq12 (t11 t11) Bool)

(declare-const dummy12 t11)

(declare-datatypes () ((t__ref11 (t__refqtmk11 (t__content11 t11)))))
(define-fun t__ref_t__content__12__projection ((a t__ref11)) t11 (t__content11
                                                                 a))

(define-fun dynamic_invariant12 ((temp___expr_257 Int)
  (temp___is_init_253 Bool) (temp___skip_constant_254 Bool)
  (temp___do_toplevel_255 Bool)
  (temp___do_typ_inv_256 Bool)) Bool (=>
                                     (or (= temp___is_init_253 true)
                                     (<= 1 10)) (in_range12 temp___expr_257)))

;; fixed_false2R__post_axiom
  (assert true)

(declare-sort my_int 0)

(declare-fun my_intqtint (my_int) Int)

;; my_int'axiom
  (assert
  (forall ((i my_int)) (and (<= 1 (my_intqtint i)) (<= (my_intqtint i) 10))))

(define-fun in_range13 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE13 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check13 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE13 (us_image) Int)

(declare-fun user_eq13 (my_int my_int) Bool)

(declare-const dummy13 my_int)

(declare-datatypes ()
((my_int__ref (my_int__refqtmk (my_int__content my_int)))))
(define-fun my_int__ref_my_int__content__projection ((a my_int__ref)) my_int 
  (my_int__content a))

(define-fun dynamic_invariant13 ((temp___expr_173 Int)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (=>
                                     (or (= temp___is_init_169 true)
                                     (<= 1 10)) (in_range13 temp___expr_173)))

(declare-const a Int)

;; Assume
  (assert (dynamic_invariant a true false true true))

(define-fun o () Int (double1 a))

;; H
  (assert (double1__function_guard o a))

;; H
  (assert (dynamic_invariant1 o true false true true))

(declare-const a1 Int)

;; H
  (assert (= a1 o))

(define-fun o1 () Int (double2 a1))

;; H
  (assert (double2__function_guard o1 a1))

;; H
  (assert (dynamic_invariant2 o1 true false true true))

(declare-const a2 Int)

;; H
  (assert (= a2 o1))

;; Ensures
  (assert (in_range13 a2))

(define-fun o2 () Int (ten1 a2))

;; H
  (assert (ten1__function_guard o2 a2))

;; H
  (assert (dynamic_invariant3 o2 true false true true))

(declare-const a3 Int)

;; H
  (assert (= a3 o2))

;; Ensures
  (assert (in_range13 a3))

(define-fun o3 () Int (ten2 a3))

;; H
  (assert (ten2__function_guard o3 a3))

;; H
  (assert (dynamic_invariant4 o3 true false true true))

(declare-const a4 Int)

;; H
  (assert (= a4 o3))

;; H
  (assert (forall ((a5 Int)) (false1__function_guard (false1 a5) a5)))

;; Assert
  (assert (not (= (false1 a4) true)))

;; H
  (assert (forall ((a5 Int)) (false2__function_guard (false2 a5) a5)))

;; Assert
  (assert (not (= (false2 a4) true)))

;; H
  (assert
  (forall ((a5 Int)) (fixed_false1R__function_guard (fixed_false1R a5) a5)))

;; Assert
  (assert (= (fixed_false1R a4) true))

;; H
  (assert
  (forall ((a5 Int)) (fixed_false2R__function_guard (fixed_false2R a5) a5)))

;; Assert
  (assert (= (fixed_false2R a4) true))

;; H
  (assert (forall ((a5 Int)) (true1R__function_guard (true1R a5) a5)))

;; Assert
  (assert (= (true1R a4) true))

;; H
  (assert (forall ((a5 Int)) (true2R__function_guard (true2R a5) a5)))

;; Assert
  (assert (= (true2R a4) true))

;; H
  (assert
  (forall ((a5 Int)) (fixed_true1__function_guard (fixed_true1 a5) a5)))

(assert
;; defqtvc
 ;; File "opers.ads", line 24, characters 0-0
  (not (not (= (fixed_true1 a4) true))))
(check-sat)
