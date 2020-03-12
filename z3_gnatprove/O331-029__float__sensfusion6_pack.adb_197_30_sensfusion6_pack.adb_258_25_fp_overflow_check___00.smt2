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

(declare-sort float__ 0)

(declare-fun user_eq (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float32)

(declare-const dummy float__)

(declare-datatypes ()
((float____ref (float____refqtmk (float____content float__)))))
(define-fun float____ref_float____content__projection ((a float____ref)) float__ 
  (float____content a))

(define-fun dynamic_invariant ((temp___expr_60 Float32)
  (temp___is_init_56 Bool) (temp___skip_constant_57 Bool)
  (temp___do_toplevel_58 Bool)
  (temp___do_typ_inv_59 Bool)) Bool (=>
                                    (or (= temp___is_init_56 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                    (fp.isFinite32 temp___expr_60)))

(declare-const gx Float32)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const gy Float32)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const gz Float32)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const ax Float32)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const ay Float32)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const az Float32)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const dt Float32)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-const attr__ATTRIBUTE_ADDRESS12 Int)

(declare-const attr__ATTRIBUTE_ADDRESS13 Int)

(declare-const attr__ATTRIBUTE_ADDRESS14 Int)

(declare-const attr__ATTRIBUTE_ADDRESS15 Int)

(declare-const attr__ATTRIBUTE_ADDRESS16 Int)

(declare-fun lift_away_from_zero (Float32) Float32)

(declare-fun lift_away_from_zero__function_guard (Float32 Float32) Bool)

(declare-sort t_acc 0)

(define-fun in_range1 ((x Float32)) Bool (and (fp.isFinite32 x)
                                         (and
                                         (fp.leq (fp.neg (fp #b0 #b10000011 #b00000000000000000000000)) x)
                                         (fp.leq x (fp #b0 #b10000011 #b00000000000000000000000)))))

(declare-fun user_eq1 (t_acc t_acc) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Float32)

(declare-const dummy1 t_acc)

(declare-datatypes () ((t_acc__ref (t_acc__refqtmk (t_acc__content t_acc)))))
(define-fun t_acc__ref_t_acc__content__projection ((a t_acc__ref)) t_acc 
  (t_acc__content a))

(define-fun dynamic_invariant1 ((temp___expr_186 Float32)
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (=>
                                     (or (= temp___is_init_182 true)
                                     (fp.leq (fp.neg (fp #b0 #b10000011 #b00000000000000000000000)) (fp #b0 #b10000011 #b00000000000000000000000)))
                                     (in_range1 temp___expr_186)))

(declare-sort t_acc_lifted 0)

(define-fun in_range2 ((x Float32)) Bool (and (fp.isFinite32 x)
                                         (and
                                         (fp.leq (fp.neg (fp #b0 #b10000011 #b00000000000000000000000)) x)
                                         (fp.leq x (fp #b0 #b10000011 #b00000000000000000000000)))))

(declare-fun user_eq2 (t_acc_lifted t_acc_lifted) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE3 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Float32)

(declare-const dummy2 t_acc_lifted)

(declare-datatypes ()
((t_acc_lifted__ref
 (t_acc_lifted__refqtmk (t_acc_lifted__content t_acc_lifted)))))
(define-fun t_acc_lifted__ref_t_acc_lifted__content__projection ((a t_acc_lifted__ref)) t_acc_lifted 
  (t_acc_lifted__content a))

(define-fun dynamic_invariant2 ((temp___expr_221 Float32)
  (temp___is_init_217 Bool) (temp___skip_constant_218 Bool)
  (temp___do_toplevel_219 Bool)
  (temp___do_typ_inv_220 Bool)) Bool (=>
                                     (or (= temp___is_init_217 true)
                                     (fp.leq (fp.neg (fp #b0 #b10000011 #b00000000000000000000000)) (fp #b0 #b10000011 #b00000000000000000000000)))
                                     (in_range2 temp___expr_221)))

;; lift_away_from_zero__post_axiom
  (assert
  (forall ((x Float32))
  (! (=> (dynamic_invariant1 x true true true true)
     (let ((result (lift_away_from_zero x)))
     (and
     (ite (fp.eq x (fp #b0 #b00000000 #b00000000000000000000000))
     (fp.eq result (fp #b0 #b00000000 #b00000000000000000000000))
     (=> (not (fp.eq x (fp #b0 #b00000000 #b00000000000000000000000)))
     (not (fp.eq result (fp #b0 #b00000000 #b00000000000000000000000)))))
     (dynamic_invariant2 result true false true true)))) :pattern ((lift_away_from_zero
                                                                   x)) )))

(declare-fun inv_sqrt (Float32) Float32)

(declare-fun inv_sqrt__function_guard (Float32 Float32) Bool)

;; inv_sqrt__post_axiom
  (assert
  (forall ((x Float32))
  (! (=>
     (and (dynamic_invariant x true true true true)
     (fp.leq (fp #b0 #b00000000 #b00000000000000000000001) x))
     (let ((result (inv_sqrt x)))
     (and
     (and (fp.lt (fp #b0 #b00000000 #b00000000000000000000000) result)
     (fp.lt result (fp #b0 #b11000010 #b01011010111100011101100)))
     (dynamic_invariant result true false true true)))) :pattern ((inv_sqrt
                                                                  x)) )))

(declare-fun saturate (Float32 Float32 Float32) Float32)

(declare-fun saturate__function_guard (Float32 Float32 Float32 Float32) Bool)

;; saturate__post_axiom
  (assert
  (forall ((value Float32) (min_value Float32) (max_value Float32))
  (! (=>
     (and
     (and (dynamic_invariant value true true true true) (dynamic_invariant
     min_value true true true true)) (dynamic_invariant max_value true true
     true true))
     (let ((result (saturate value min_value max_value)))
     (and
     (ite (fp.lt value min_value) (fp.eq result min_value)
     (ite (fp.lt max_value value) (fp.eq result max_value)
     (fp.eq result value))) (dynamic_invariant result true false true true)))) :pattern (
  (saturate value min_value max_value)) )))

(declare-const c3b Float32)

(declare-const attr__ATTRIBUTE_ADDRESS17 Int)

(declare-const c4b Float32)

(declare-const attr__ATTRIBUTE_ADDRESS18 Int)

(declare-const c5b Float32)

(declare-const attr__ATTRIBUTE_ADDRESS19 Int)

(declare-const c6b Float32)

(declare-const attr__ATTRIBUTE_ADDRESS20 Int)

(declare-const c7b Float32)

(declare-const attr__ATTRIBUTE_ADDRESS21 Int)

(declare-const c8b Float32)

(declare-const attr__ATTRIBUTE_ADDRESS22 Int)

(declare-const c9b Float32)

(declare-const attr__ATTRIBUTE_ADDRESS23 Int)

(declare-const attr__ATTRIBUTE_ADDRESS24 Int)

(declare-const attr__ATTRIBUTE_ADDRESS25 Int)

(declare-const attr__ATTRIBUTE_ADDRESS26 Int)

(declare-const attr__ATTRIBUTE_ADDRESS27 Int)

(declare-const attr__ATTRIBUTE_ADDRESS28 Int)

(declare-const attr__ATTRIBUTE_ADDRESS29 Int)

(declare-const attr__ATTRIBUTE_ADDRESS30 Int)

(declare-const attr__ATTRIBUTE_ADDRESS31 Int)

(declare-const attr__ATTRIBUTE_ADDRESS32 Int)

(declare-const attr__ATTRIBUTE_ADDRESS33 Int)

(declare-const attr__ATTRIBUTE_ADDRESS34 Int)

(declare-const attr__ATTRIBUTE_ADDRESS35 Int)

(declare-const attr__ATTRIBUTE_ADDRESS36 Int)

(declare-const attr__ATTRIBUTE_ADDRESS37 Int)

(declare-const attr__ATTRIBUTE_ADDRESS38 Int)

(declare-const attr__ATTRIBUTE_ADDRESS39 Int)

(declare-const attr__ATTRIBUTE_ADDRESS40 Int)

(declare-const attr__ATTRIBUTE_ADDRESS41 Int)

(declare-const attr__ATTRIBUTE_ADDRESS42 Int)

(declare-const attr__ATTRIBUTE_ADDRESS43 Int)

(declare-const c11b Float32)

(declare-const attr__ATTRIBUTE_ADDRESS44 Int)

(declare-const c12b Float32)

(declare-const attr__ATTRIBUTE_ADDRESS45 Int)

(declare-const c13b Float32)

(declare-const attr__ATTRIBUTE_ADDRESS46 Int)

(declare-const c14b Float32)

(declare-const attr__ATTRIBUTE_ADDRESS47 Int)

(declare-const c15b Float32)

(declare-const attr__ATTRIBUTE_ADDRESS48 Int)

(declare-const c16b Float32)

(declare-const attr__ATTRIBUTE_ADDRESS49 Int)

(declare-const c17b Float32)

(declare-const attr__ATTRIBUTE_ADDRESS50 Int)

(declare-const attr__ATTRIBUTE_ADDRESS51 Int)

(declare-const attr__ATTRIBUTE_ADDRESS52 Int)

(declare-const attr__ATTRIBUTE_ADDRESS53 Int)

(declare-const attr__ATTRIBUTE_ADDRESS54 Int)

(declare-const attr__ATTRIBUTE_ADDRESS55 Int)

(declare-const attr__ATTRIBUTE_ADDRESS56 Int)

(declare-const attr__ATTRIBUTE_ADDRESS57 Int)

(declare-const attr__ATTRIBUTE_ADDRESS58 Int)

(declare-const attr__ATTRIBUTE_ADDRESS59 Int)

(declare-const attr__ATTRIBUTE_ADDRESS60 Int)

(declare-const attr__ATTRIBUTE_ADDRESS61 Int)

(declare-const attr__ATTRIBUTE_ADDRESS62 Int)

(declare-const attr__ATTRIBUTE_ADDRESS63 Int)

(declare-const attr__ATTRIBUTE_ADDRESS64 Int)

(declare-const attr__ATTRIBUTE_ADDRESS65 Int)

(declare-const attr__ATTRIBUTE_ADDRESS66 Int)

(declare-const attr__ATTRIBUTE_ADDRESS67 Int)

(declare-const attr__ATTRIBUTE_ADDRESS68 Int)

(declare-const attr__ATTRIBUTE_ADDRESS69 Int)

(declare-const attr__ATTRIBUTE_ADDRESS70 Int)

(declare-const attr__ATTRIBUTE_ADDRESS71 Int)

(declare-const attr__ATTRIBUTE_ADDRESS72 Int)

(declare-const attr__ATTRIBUTE_ADDRESS73 Int)

(declare-const attr__ATTRIBUTE_ADDRESS74 Int)

(declare-const attr__ATTRIBUTE_ADDRESS75 Int)

(declare-const attr__ATTRIBUTE_ADDRESS76 Int)

(declare-const attr__ATTRIBUTE_ADDRESS77 Int)

(declare-const attr__ATTRIBUTE_ADDRESS78 Int)

(declare-const attr__ATTRIBUTE_ADDRESS79 Int)

(declare-const attr__ATTRIBUTE_ADDRESS80 Int)

(declare-const attr__ATTRIBUTE_ADDRESS81 Int)

(declare-const attr__ATTRIBUTE_ADDRESS82 Int)

(declare-const attr__ATTRIBUTE_ADDRESS83 Int)

(declare-sort t_rate 0)

(define-fun in_range3 ((x Float32)) Bool (and (fp.isFinite32 x)
                                         (and
                                         (fp.leq (fp.neg (fp #b0 #b10001010 #b01110111000000000000000)) x)
                                         (fp.leq x (fp #b0 #b10001010 #b01110111000000000000000)))))

(declare-fun user_eq3 (t_rate t_rate) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE4 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Float32)

(declare-const dummy3 t_rate)

(declare-datatypes ()
((t_rate__ref (t_rate__refqtmk (t_rate__content t_rate)))))
(define-fun t_rate__ref_t_rate__content__projection ((a t_rate__ref)) t_rate 
  (t_rate__content a))

(define-fun dynamic_invariant3 ((temp___expr_179 Float32)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (fp.leq (fp.neg (fp #b0 #b10001010 #b01110111000000000000000)) (fp #b0 #b10001010 #b01110111000000000000000)))
                                     (in_range3 temp___expr_179)))

(declare-sort t_delta_time 0)

(define-fun in_range4 ((x Float32)) Bool (and (fp.isFinite32 x)
                                         (and
                                         (fp.leq (fp #b0 #b01110101 #b00000110001001001101111) x)
                                         (fp.leq x (fp #b0 #b01111111 #b00000000000000000000000)))))

(declare-fun user_eq4 (t_delta_time t_delta_time) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE5 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Float32)

(declare-const dummy4 t_delta_time)

(declare-datatypes ()
((t_delta_time__ref
 (t_delta_time__refqtmk (t_delta_time__content t_delta_time)))))
(define-fun t_delta_time__ref_t_delta_time__content__projection ((a t_delta_time__ref)) t_delta_time 
  (t_delta_time__content a))

(define-fun dynamic_invariant4 ((temp___expr_193 Float32)
  (temp___is_init_189 Bool) (temp___skip_constant_190 Bool)
  (temp___do_toplevel_191 Bool)
  (temp___do_typ_inv_192 Bool)) Bool (=>
                                     (or (= temp___is_init_189 true)
                                     (fp.leq (fp #b0 #b01110101 #b00000110001001001101111) (fp #b0 #b01111111 #b00000000000000000000000)))
                                     (in_range4 temp___expr_193)))

(declare-sort t_quaternion 0)

(define-fun in_range5 ((x Float32)) Bool (and (fp.isFinite32 x)
                                         (and
                                         (fp.leq (fp.neg (fp #b0 #b01111111 #b00000000000000000000000)) x)
                                         (fp.leq x (fp #b0 #b01111111 #b00000000000000000000000)))))

(declare-fun user_eq5 (t_quaternion t_quaternion) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE6 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Float32)

(declare-const dummy5 t_quaternion)

(declare-datatypes ()
((t_quaternion__ref
 (t_quaternion__refqtmk (t_quaternion__content t_quaternion)))))
(define-fun t_quaternion__ref_t_quaternion__content__projection ((a t_quaternion__ref)) t_quaternion 
  (t_quaternion__content a))

(define-fun dynamic_invariant5 ((temp___expr_207 Float32)
  (temp___is_init_203 Bool) (temp___skip_constant_204 Bool)
  (temp___do_toplevel_205 Bool)
  (temp___do_typ_inv_206 Bool)) Bool (=>
                                     (or (= temp___is_init_203 true)
                                     (fp.leq (fp.neg (fp #b0 #b01111111 #b00000000000000000000000)) (fp #b0 #b01111111 #b00000000000000000000000)))
                                     (in_range5 temp___expr_207)))

(declare-sort t_alpha 0)

(define-fun in_range6 ((x Float32)) Bool (and (fp.isFinite32 x)
                                         (and
                                         (fp.leq (fp #b0 #b00000000 #b00000000000000000000000) x)
                                         (fp.leq x (fp #b0 #b01111111 #b00000000000000000000000)))))

(declare-fun user_eq6 (t_alpha t_alpha) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE7 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Float32)

(declare-const dummy6 t_alpha)

(declare-datatypes ()
((t_alpha__ref (t_alpha__refqtmk (t_alpha__content t_alpha)))))
(define-fun t_alpha__ref_t_alpha__content__projection ((a t_alpha__ref)) t_alpha 
  (t_alpha__content a))

(define-fun dynamic_invariant6 ((temp___expr_214 Float32)
  (temp___is_init_210 Bool) (temp___skip_constant_211 Bool)
  (temp___do_toplevel_212 Bool)
  (temp___do_typ_inv_213 Bool)) Bool (=>
                                     (or (= temp___is_init_210 true)
                                     (fp.leq (fp #b0 #b00000000 #b00000000000000000000000) (fp #b0 #b01111111 #b00000000000000000000000)))
                                     (in_range6 temp___expr_214)))

(declare-sort positive_float 0)

(define-fun in_range7 ((x Float32)) Bool (and (fp.isFinite32 x)
                                         (and
                                         (fp.leq (fp #b0 #b00000000 #b00000000000000000000000) x)
                                         (fp.leq x (fp #b0 #b11111110 #b11111111111111111111111)))))

(declare-fun user_eq7 (positive_float positive_float) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE8 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Float32)

(declare-const dummy7 positive_float)

(declare-datatypes ()
((positive_float__ref
 (positive_float__refqtmk (positive_float__content positive_float)))))
(define-fun positive_float__ref_positive_float__content__projection ((a positive_float__ref)) positive_float 
  (positive_float__content a))

(define-fun dynamic_invariant7 ((temp___expr_228 Float32)
  (temp___is_init_224 Bool) (temp___skip_constant_225 Bool)
  (temp___do_toplevel_226 Bool)
  (temp___do_typ_inv_227 Bool)) Bool (=>
                                     (or (= temp___is_init_224 true)
                                     (fp.leq (fp #b0 #b00000000 #b00000000000000000000000) (fp #b0 #b11111110 #b11111111111111111111111)))
                                     (in_range7 temp___expr_228)))

;; c3b__def_axiom
  (assert (= c3b gx))

;; c4b__def_axiom
  (assert (= c4b gy))

;; c5b__def_axiom
  (assert (= c5b gz))

;; c6b__def_axiom
  (assert (= c6b ax))

;; c7b__def_axiom
  (assert (= c7b ay))

;; c8b__def_axiom
  (assert (= c8b az))

;; c9b__def_axiom
  (assert (= c9b dt))

;; c11b__def_axiom
  (assert (= c11b gx))

;; c12b__def_axiom
  (assert (= c12b gy))

;; c13b__def_axiom
  (assert (= c13b gz))

;; c14b__def_axiom
  (assert (= c14b ax))

;; c15b__def_axiom
  (assert (= c15b ay))

;; c16b__def_axiom
  (assert (= c16b az))

;; c17b__def_axiom
  (assert (= c17b dt))

(declare-const q0 Float32)

(declare-const q1 Float32)

(declare-const q2 Float32)

(declare-const q3 Float32)

(declare-const two_kp Float32)

(declare-const two_ki Float32)

(declare-const integral_fbx Float32)

(declare-const integral_fby Float32)

(declare-const integral_fbz Float32)

(declare-const beta Float32)

(declare-const recip_norm Float32)

(declare-const norm_ax Float32)

(declare-const norm_ay Float32)

(declare-const norm_az Float32)

(declare-const half_ex Float32)

(declare-const half_ey Float32)

(declare-const half_ez Float32)

(declare-const q0_tmp Float32)

(declare-const q1_tmp Float32)

(declare-const q2_tmp Float32)

(declare-const q3_tmp Float32)

(declare-const recip_norm1 Float32)

(declare-const s0 Float32)

(declare-const s1 Float32)

(declare-const s2 Float32)

(declare-const s3 Float32)

(declare-const q_dot1 Float32)

(declare-const q_dot2 Float32)

(declare-const q_dot3 Float32)

(declare-const q_dot4 Float32)

(declare-const q0_x2 Float32)

(declare-const q1_x2 Float32)

(declare-const q2_x2 Float32)

(declare-const q3_x2 Float32)

(declare-const q0_x4 Float32)

(declare-const q1_x4 Float32)

(declare-const q2_x4 Float32)

(declare-const q1_x8 Float32)

(declare-const q2_x8 Float32)

(declare-const q0_q0 Float32)

(declare-const q1_q1 Float32)

(declare-const q2_q2 Float32)

(declare-const q3_q3 Float32)

(declare-const norm_ax1 Float32)

(declare-const norm_ay1 Float32)

(declare-const norm_az1 Float32)

(declare-const q0_tmp1 Float32)

(declare-const q1_tmp1 Float32)

(declare-const q2_tmp1 Float32)

(declare-const q3_tmp1 Float32)

(declare-const ax_tmp Float32)

(declare-const ay_tmp Float32)

(declare-const az_tmp Float32)

(declare-const square_sum Float32)

;; Assume
  (assert (dynamic_invariant3 gx true false true true))

;; Assume
  (assert (dynamic_invariant3 gy true false true true))

;; Assume
  (assert (dynamic_invariant3 gz true false true true))

;; Assume
  (assert (dynamic_invariant1 ax true false true true))

;; Assume
  (assert (dynamic_invariant1 ay true false true true))

;; Assume
  (assert (dynamic_invariant1 az true false true true))

;; Assume
  (assert (dynamic_invariant4 dt true false true true))

;; Assume
  (assert (dynamic_invariant5 q0 true false true true))

;; Assume
  (assert (dynamic_invariant5 q1 true false true true))

;; Assume
  (assert (dynamic_invariant5 q2 true false true true))

;; Assume
  (assert (dynamic_invariant5 q3 true false true true))

;; Assume
  (assert (dynamic_invariant two_kp true false true true))

;; Assume
  (assert (dynamic_invariant two_ki true false true true))

;; Assume
  (assert (dynamic_invariant integral_fbx true false true true))

;; Assume
  (assert (dynamic_invariant integral_fby true false true true))

;; Assume
  (assert (dynamic_invariant integral_fbz true false true true))

;; Assume
  (assert (dynamic_invariant6 beta true false true true))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite true true false)))

;; H
  (assert (= spark__branch true))

;; Assume
  (assert (= gx c3b))

;; Assume
  (assert (dynamic_invariant3 c3b true false true true))

;; Assume
  (assert (= gy c4b))

;; Assume
  (assert (dynamic_invariant3 c4b true false true true))

;; Assume
  (assert (= gz c5b))

;; Assume
  (assert (dynamic_invariant3 c5b true false true true))

;; Assume
  (assert (= ax c6b))

;; Assume
  (assert (dynamic_invariant1 c6b true false true true))

;; Assume
  (assert (= ay c7b))

;; Assume
  (assert (dynamic_invariant1 c7b true false true true))

;; Assume
  (assert (= az c8b))

;; Assume
  (assert (dynamic_invariant1 c8b true false true true))

;; Assume
  (assert (= dt c9b))

;; Assume
  (assert (dynamic_invariant4 c9b true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant recip_norm false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 norm_ax false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 norm_ay false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 norm_az false false true true))

(declare-const rad_gx Float32)

;; H
  (assert
  (= rad_gx (fp.div RNE (fp.mul RNE c3b (fp #b0 #b10000000 #b10010010000111111011011)) (fp #b0 #b10000110 #b01101000000000000000000))))

;; Assume
  (assert (dynamic_invariant rad_gx true false true true))

(declare-const rad_gy Float32)

;; H
  (assert
  (= rad_gy (fp.div RNE (fp.mul RNE c4b (fp #b0 #b10000000 #b10010010000111111011011)) (fp #b0 #b10000110 #b01101000000000000000000))))

;; Assume
  (assert (dynamic_invariant rad_gy true false true true))

(declare-const rad_gz Float32)

;; H
  (assert
  (= rad_gz (fp.div RNE (fp.mul RNE c5b (fp #b0 #b10000000 #b10010010000111111011011)) (fp #b0 #b10000110 #b01101000000000000000000))))

;; Assume
  (assert (dynamic_invariant rad_gz true false true true))

(declare-const half_vx Float32)

;; H
  (assert (= half_vx (fp.sub RNE (fp.mul RNE q1 q3) (fp.mul RNE q0 q2))))

;; Assume
  (assert (dynamic_invariant half_vx true false true true))

(declare-const half_vy Float32)

;; H
  (assert (= half_vy (fp.add RNE (fp.mul RNE q0 q1) (fp.mul RNE q2 q3))))

;; Assume
  (assert (dynamic_invariant half_vy true false true true))

(declare-const half_vz Float32)

;; H
  (assert
  (= half_vz (fp.add RNE (fp.sub RNE (fp.mul RNE q0 q0) (fp #b0 #b01111110 #b00000000000000000000000)) (fp.mul RNE 
  q3 q3))))

;; Assume
  (assert (dynamic_invariant half_vz true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant half_ex false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant half_ey false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant half_ez false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant q0_tmp false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant q1_tmp false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant q2_tmp false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant q3_tmp false false true true))

(declare-const qa Float32)

;; H
  (assert (= qa q0))

;; Assume
  (assert (dynamic_invariant5 qa true false true true))

(declare-const qb Float32)

;; H
  (assert (= qb q1))

;; Assume
  (assert (dynamic_invariant5 qb true false true true))

(declare-const qc Float32)

;; H
  (assert (= qc q2))

;; Assume
  (assert (dynamic_invariant5 qc true false true true))

(declare-const spark__branch1 Bool)

;; H
  (assert
  (= spark__branch1 (ite (= (and (and (ite (fp.eq c6b (fp #b0 #b00000000 #b00000000000000000000000))
                                      true false) (ite (fp.eq c7b (fp #b0 #b00000000 #b00000000000000000000000))
                                                  true false)) (ite (fp.eq 
                                                               c8b (fp #b0 #b00000000 #b00000000000000000000000))
                                                               true false)) true)
                    false true)))

;; H
  (assert (= spark__branch1 true))

(define-fun o () Float32 (fp.add RNE (fp.add RNE (fp.mul RNE c6b c6b) (fp.mul RNE 
  c7b c7b)) (fp.mul RNE c8b c8b)))

(define-fun o1 () Float32 (inv_sqrt o))

;; H
  (assert (dynamic_invariant o1 true false true true))

;; H
  (assert (fp.lt (fp #b0 #b00000000 #b00000000000000000000000) o1))

;; H
  (assert (fp.lt o1 (fp #b0 #b11000010 #b01011010111100011101100)))

(declare-const recip_norm2 Float32)

;; H
  (assert (= recip_norm2 o1))

(define-fun o2 () Float32 (fp.neg (fp #b0 #b01111111 #b00000000000000000000000)))

(define-fun o3 () Float32 (fp.mul RNE c6b recip_norm2))

;; Ensures
  (assert (fp.isFinite32 o3))

(define-fun o4 () Float32 (saturate o3 o2
                          (fp #b0 #b01111111 #b00000000000000000000000)))

;; H
  (assert (dynamic_invariant o4 true false true true))

;; H
  (assert
  (ite (fp.lt o3 o2) (fp.eq o4 o2)
  (ite (fp.lt (fp #b0 #b01111111 #b00000000000000000000000) o3)
  (fp.eq o4 (fp #b0 #b01111111 #b00000000000000000000000)) (fp.eq o4 
  o3))))

;; Ensures
  (assert (fp.isFinite32 o4))

(declare-const norm_ax2 Float32)

;; H
  (assert (= norm_ax2 o4))

(define-fun o5 () Float32 (fp.neg (fp #b0 #b01111111 #b00000000000000000000000)))

(define-fun o6 () Float32 (fp.mul RNE c7b recip_norm2))

;; Ensures
  (assert (fp.isFinite32 o6))

(define-fun o7 () Float32 (saturate o6 o5
                          (fp #b0 #b01111111 #b00000000000000000000000)))

;; H
  (assert (dynamic_invariant o7 true false true true))

;; H
  (assert
  (ite (fp.lt o6 o5) (fp.eq o7 o5)
  (ite (fp.lt (fp #b0 #b01111111 #b00000000000000000000000) o6)
  (fp.eq o7 (fp #b0 #b01111111 #b00000000000000000000000)) (fp.eq o7 
  o6))))

;; Ensures
  (assert (fp.isFinite32 o7))

(declare-const norm_ay2 Float32)

;; H
  (assert (= norm_ay2 o7))

(define-fun o8 () Float32 (fp.neg (fp #b0 #b01111111 #b00000000000000000000000)))

(define-fun o9 () Float32 (fp.mul RNE c8b recip_norm2))

;; Ensures
  (assert (fp.isFinite32 o9))

(define-fun o10 () Float32 (saturate o9 o8
                           (fp #b0 #b01111111 #b00000000000000000000000)))

;; H
  (assert (dynamic_invariant o10 true false true true))

;; H
  (assert
  (ite (fp.lt o9 o8) (fp.eq o10 o8)
  (ite (fp.lt (fp #b0 #b01111111 #b00000000000000000000000) o9)
  (fp.eq o10 (fp #b0 #b01111111 #b00000000000000000000000)) (fp.eq o10 
  o9))))

;; Ensures
  (assert (fp.isFinite32 o10))

(declare-const norm_az2 Float32)

;; H
  (assert (= norm_az2 o10))

(define-fun o11 () Float32 (fp.mul RNE norm_az2 half_vy))

;; Ensures
  (assert (fp.isFinite32 o11))

(define-fun o12 () Float32 (fp.mul RNE norm_ay2 half_vz))

(assert
;; defqtvc
 ;; File "sensfusion6_pack.ads", line 17, characters 0-0
  (not (fp.isFinite32 o12)))
(check-sat)
