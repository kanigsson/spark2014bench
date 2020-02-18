;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
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
(declare-fun equal (Float32 Float32) Bool)

(declare-fun equal__function_guard (Bool Float32 Float32) Bool)

(declare-sort t_float32 0)

(declare-fun user_eq (t_float32 t_float32) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Float32)

(declare-const dummy t_float32)

(declare-datatypes ((t_float32__ref 0))
(((t_float32__refqtmk (t_float32__content t_float32)))))
(define-fun t_float32__ref_t_float32__content__projection ((a t_float32__ref)) t_float32 
  (t_float32__content a))

(define-fun dynamic_invariant ((temp___expr_159 Float32)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                     (fp.isFinite32 temp___expr_159)))

;; equal__post_axiom
  (assert true)

;; equal__def_axiom
  (assert
  (forall ((x1 Float32) (x2 Float32))
  (! (= (= (equal x1 x2) true)
     (fp.lt (fp.abs (fp.sub RNE x1 x2)) (fp #b0 #b01101101 #b00001100011011110111101))) :pattern (
  (equal x1 x2)) )))

(declare-const x Float32)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const y Float32)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort tt_float32B 0)

(declare-fun user_eq1 (tt_float32B tt_float32B) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float32)

(declare-const dummy1 tt_float32B)

(declare-datatypes ((tt_float32B__ref 0))
(((tt_float32B__refqtmk (tt_float32B__content tt_float32B)))))
(define-fun tt_float32B__ref_tt_float32B__content__projection ((a tt_float32B__ref)) tt_float32B 
  (tt_float32B__content a))

(declare-sort t_x1 0)

(define-fun in_range ((x1 Float32)) Bool (and (fp.isFinite32 x1)
                                         (and
                                         (fp.leq (fp.neg (fp #b0 #b01111001 #b00001000010000100000111)) x1)
                                         (fp.leq x1 (fp #b0 #b01111001 #b00001000010000100000111)))))

(declare-fun user_eq2 (t_x1 t_x1) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Float32)

(declare-const dummy2 t_x1)

(declare-datatypes ((t_x1__ref 0))
(((t_x1__refqtmk (t_x1__content t_x1)))))
(define-fun t_x1__ref_t_x1__content__projection ((a t_x1__ref)) t_x1 
  (t_x1__content a))

(define-fun dynamic_invariant1 ((temp___expr_166 Float32)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (fp.leq (fp.neg (fp #b0 #b01111001 #b00001000010000100000111)) (fp #b0 #b01111001 #b00001000010000100000111)))
                                     (in_range temp___expr_166)))

(declare-sort t_y 0)

(define-fun in_range1 ((x1 Float32)) Bool (and (fp.isFinite32 x1)
                                          (and
                                          (fp.leq (fp.neg (fp #b0 #b10000110 #b01101000000000000000000)) x1)
                                          (fp.leq x1 (fp #b0 #b10000110 #b01101000000000000000000)))))

(declare-fun user_eq3 (t_y t_y) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE3 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Float32)

(declare-const dummy3 t_y)

(declare-datatypes ((t_y__ref 0))
(((t_y__refqtmk (t_y__content t_y)))))
(define-fun t_y__ref_t_y__content__projection ((a t_y__ref)) t_y (t_y__content
                                                                 a))

(define-fun dynamic_invariant2 ((temp___expr_180 Float32)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (=>
                                     (or (= temp___is_init_176 true)
                                     (fp.leq (fp.neg (fp #b0 #b10000110 #b01101000000000000000000)) (fp #b0 #b10000110 #b01101000000000000000000)))
                                     (in_range1 temp___expr_180)))

(declare-sort t_z 0)

(define-fun in_range2 ((x1 Float32)) Bool (and (fp.isFinite32 x1)
                                          (and
                                          (fp.leq (fp.neg (fp #b0 #b01111110 #b00000000000000000000000)) x1)
                                          (fp.leq x1 (fp #b0 #b01111110 #b00000000000000000000000)))))

(declare-fun user_eq4 (t_z t_z) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE4 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Float32)

(declare-const dummy4 t_z)

(declare-datatypes ((t_z__ref 0))
(((t_z__refqtmk (t_z__content t_z)))))
(define-fun t_z__ref_t_z__content__projection ((a t_z__ref)) t_z (t_z__content
                                                                 a))

(define-fun dynamic_invariant3 ((temp___expr_187 Float32)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=>
                                     (or (= temp___is_init_183 true)
                                     (fp.leq (fp.neg (fp #b0 #b01111110 #b00000000000000000000000)) (fp #b0 #b01111110 #b00000000000000000000000)))
                                     (in_range2 temp___expr_187)))

(assert
;; defqtvc
 ;; File "proof.ads", line 26, characters 0-0
  (not
  (forall ((z Float32) (t Float32))
  (=> (dynamic_invariant1 x true false true true)
  (=> (dynamic_invariant2 y true false true true)
  (=> (dynamic_invariant3 z true false true true)
  (=> (dynamic_invariant t false false true true)
  (fp.leq x (fp #b0 #b11111101 #b11111111111111111111111)))))))))
(check-sat)