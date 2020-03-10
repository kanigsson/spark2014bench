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

(declare-fun nth ((_ BitVec 8) Int) Bool)

(declare-fun lsr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun asr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun lsl ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

;; Div_unique
  (assert
  (forall ((x Int) (y Int) (q Int))
  (=> (< 0 y) (=> (and (<= (* q y) x) (< x (+ (* q y) y))) (= (div x y) q)))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div x y)) (<= (div x y) x)))))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div x y) 0))))

;; Div_inf_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (< 0 x) (<= x y)) (= (div (- x) y) (- 1)))))

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
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (div (+ (* x y) z) x) (+ y (div z x)))) :pattern ((div (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (mod (+ (* x y) z) x) (mod z x))) :pattern ((mod (+ (* x y) z) x)) )))

(declare-fun rotate_right1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_left1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 8))) Int (ite (bvsge x (_ bv0 8))
                                           (bv2nat x) (- (- 256 (bv2nat x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 255)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvshl x n) (lsl x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvor (bvshl v (bvurem n (_ bv8 8))) (bvlshr v (bvsub (_ bv8 8) (bvurem n (_ bv8 8))))) 
  (rotate_left1 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvor (bvlshr v (bvurem n (_ bv8 8))) (bvshl v (bvsub (_ bv8 8) (bvurem n (_ bv8 8))))) 
  (rotate_right1 v (bv2nat n)))))

(declare-fun nth_bv ((_ BitVec 8) (_ BitVec 8)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 8)) (i (_ BitVec 8)))
  (= (= (nth_bv x i) true) (not (= (bvand (bvlshr x i) #x01) #x00)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 8)) (i (_ BitVec 8)))
  (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 8)) (i Int))
  (=> (and (<= 0 i) (< i 256)) (= (nth_bv x ((_ int2bv 8) i)) (nth x i)))))

(declare-fun eq_sub_bv ((_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 8)) (b (_ BitVec 8)) (i (_ BitVec 8))
  (n (_ BitVec 8)))
  (let ((mask (bvshl (bvsub (bvshl #x01 n) #x01) i)))
  (= (eq_sub_bv a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub ((a (_ BitVec 8)) (b (_ BitVec 8)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 8)) (b (_ BitVec 8)) (i (_ BitVec 8))
  (n (_ BitVec 8)))
  (= (eq_sub a b (bv2nat i) (bv2nat n)) (eq_sub_bv a b i n))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content (_ BitVec 8))))))
(declare-fun power ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun bv_min ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) y x))

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

(declare-datatypes ((t__ref1 0))
(((t__refqtmk1 (t__content1 Float32)))))
(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort battery_level_type 0)

(declare-fun user_eq (battery_level_type battery_level_type) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float32)

(declare-const dummy battery_level_type)

(declare-datatypes ((battery_level_type__ref 0))
(((battery_level_type__refqtmk
  (battery_level_type__content battery_level_type)))))
(define-fun battery_level_type__ref_battery_level_type__content__projection ((a battery_level_type__ref)) battery_level_type 
  (battery_level_type__content a))

(declare-fun to_rep (battery_level_type) Float32)

(declare-fun of_rep (Float32) battery_level_type)

;; inversion_axiom
  (assert
  (forall ((x battery_level_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x battery_level_type))
  (! (fp.isFinite32 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Float32))
  (! (=> (fp.isFinite32 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                                (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array (_ BitVec 8) battery_level_type))))))
(declare-fun slide ((Array (_ BitVec 8) battery_level_type) (_ BitVec 8)
  (_ BitVec 8)) (Array (_ BitVec 8) battery_level_type))

;; slide_eq
  (assert
  (forall ((a (Array (_ BitVec 8) battery_level_type)))
  (forall ((first (_ BitVec 8)))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array (_ BitVec 8) battery_level_type)))
  (forall ((old_first (_ BitVec 8)))
  (forall ((new_first (_ BitVec 8)))
  (forall ((i (_ BitVec 8)))
  (! (= (select (slide a old_first new_first) i) (select a (bvsub i (bvsub new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array (_ BitVec 8) battery_level_type))
  (a__first (_ BitVec 8)) (a__last (_ BitVec 8))
  (b (Array (_ BitVec 8) battery_level_type)) (b__first (_ BitVec 8))
  (b__last (_ BitVec 8))) Bool (ite (and
                                    (ite (bvule a__first a__last)
                                    (and (bvule b__first b__last)
                                    (= (bvsub a__last a__first) (bvsub b__last b__first)))
                                    (bvugt b__first b__last))
                                    (forall ((temp___idx_155 (_ BitVec 8)))
                                    (=>
                                    (and (bvule a__first temp___idx_155)
                                    (bvule temp___idx_155 a__last))
                                    (fp.eq (to_rep (select a temp___idx_155)) 
                                    (to_rep
                                    (select b (bvadd (bvsub b__first a__first) temp___idx_155)))))))
                               true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array (_ BitVec 8) battery_level_type))
  (b (Array (_ BitVec 8) battery_level_type)))
  (forall ((a__first (_ BitVec 8)) (a__last (_ BitVec 8))
  (b__first (_ BitVec 8)) (b__last (_ BitVec 8)))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (bvule a__first a__last)
  (and (bvule b__first b__last)
  (= (bvsub a__last a__first) (bvsub b__last b__first)))
  (bvugt b__first b__last))
  (forall ((temp___idx_155 (_ BitVec 8)))
  (=> (and (bvule a__first temp___idx_155) (bvule temp___idx_155 a__last))
  (fp.eq (to_rep (select a temp___idx_155)) (to_rep
                                            (select b (bvadd (bvsub b__first a__first) temp___idx_155)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun is_valid ((Array (_ BitVec 8) battery_level_type) (_ BitVec 8)
  us_private) Bool)

(declare-fun is_valid__function_guard (Bool
  (Array (_ BitVec 8) battery_level_type) (_ BitVec 8) us_private) Bool)

(declare-sort time_slot 0)

(define-fun in_range1 ((x (_ BitVec 8))) Bool (and (bvule #x00 x)
                                              (bvule x #x31)))

(define-fun in_range_int ((x Int)) Bool (and (<= 0 x) (<= x 49)))

(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 8))

(declare-fun user_eq1 (time_slot time_slot) Bool)

(declare-const dummy1 time_slot)

(declare-datatypes ((time_slot__ref 0))
(((time_slot__refqtmk (time_slot__content time_slot)))))
(define-fun time_slot__ref_time_slot__content__projection ((a time_slot__ref)) time_slot 
  (time_slot__content a))

(define-fun dynamic_invariant ((temp___expr_194 (_ BitVec 8))
  (temp___is_init_190 Bool) (temp___skip_constant_191 Bool)
  (temp___do_toplevel_192 Bool)
  (temp___do_typ_inv_193 Bool)) Bool (=>
                                     (or (= temp___is_init_190 true)
                                     (bvule #x00 #x31)) (in_range1
                                     temp___expr_194)))

(declare-fun is_raised ((Array (_ BitVec 8) battery_level_type) (_ BitVec 8)
  us_private) Bool)

(declare-fun is_raised__function_guard (Bool
  (Array (_ BitVec 8) battery_level_type) (_ BitVec 8) us_private) Bool)

(declare-fun time_below_threshold ((Array (_ BitVec 8) battery_level_type)
  (_ BitVec 8)) (_ BitVec 8))

(declare-fun time_below_threshold__function_guard ((_ BitVec 8)
  (Array (_ BitVec 8) battery_level_type) (_ BitVec 8)) Bool)

;; is_raised__post_axiom
  (assert
  (forall
  ((failsafe__model__battery_level_at (Array (_ BitVec 8) battery_level_type)))
  (forall ((failsafe__model__current_time (_ BitVec 8)))
  (forall ((failsafe__counter us_private))
  (! (and
     (forall
     ((failsafe__model__battery_level_at1 (Array (_ BitVec 8) battery_level_type))
     (failsafe__model__current_time1 (_ BitVec 8))
     (failsafe__counter1 us_private)) (is_valid__function_guard
     (is_valid failsafe__model__battery_level_at1
     failsafe__model__current_time1 failsafe__counter1)
     failsafe__model__battery_level_at1 failsafe__model__current_time1
     failsafe__counter1))
     (=>
     (and (dynamic_invariant failsafe__model__current_time true true true
     true)
     (= (is_valid failsafe__model__battery_level_at
        failsafe__model__current_time failsafe__counter) true))
     (let ((result (is_raised failsafe__model__battery_level_at
                   failsafe__model__current_time failsafe__counter)))
     (and
     (forall
     ((failsafe__model__battery_level_at1 (Array (_ BitVec 8) battery_level_type))
     (failsafe__model__current_time1 (_ BitVec 8))
     (failsafe__counter1 us_private)) (is_valid__function_guard
     (is_valid failsafe__model__battery_level_at1
     failsafe__model__current_time1 failsafe__counter1)
     failsafe__model__battery_level_at1 failsafe__model__current_time1
     failsafe__counter1))
     (and
     (forall
     ((failsafe__model__battery_level_at1 (Array (_ BitVec 8) battery_level_type))
     (failsafe__model__current_time1 (_ BitVec 8)))
     (time_below_threshold__function_guard
     (time_below_threshold failsafe__model__battery_level_at1
     failsafe__model__current_time1) failsafe__model__battery_level_at1
     failsafe__model__current_time1))
     (=> (is_raised__function_guard result failsafe__model__battery_level_at
     failsafe__model__current_time failsafe__counter)
     (and
     (= (is_valid failsafe__model__battery_level_at
        failsafe__model__current_time failsafe__counter) true)
     (= (= result true)
     (bvuge (time_below_threshold failsafe__model__battery_level_at
            failsafe__model__current_time) #x32))))))))) :pattern ((is_raised
                                                                   failsafe__model__battery_level_at
                                                                   failsafe__model__current_time
                                                                   failsafe__counter)) )))))

(define-fun dynamic_invariant1 ((temp___expr_185 Float32)
  (temp___is_init_181 Bool) (temp___skip_constant_182 Bool)
  (temp___do_toplevel_183 Bool)
  (temp___do_typ_inv_184 Bool)) Bool (=>
                                     (or (= temp___is_init_181 true)
                                     (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                     (fp.isFinite32 temp___expr_185)))

(declare-const battery_threshold Float32)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

;; battery_threshold__def_axiom
  (assert
  (= battery_threshold (fp #b0 #b01111100 #b10011001100110011001101)))

(declare-sort time_slot_length 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(define-fun in_range2 ((x (_ BitVec 8))) Bool (and (bvule #x00 x)
                                              (bvule x #x32)))

(define-fun in_range_int1 ((x Int)) Bool (and (<= 0 x) (<= x 50)))

(declare-fun attr__ATTRIBUTE_IMAGE3 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) (_ BitVec 8))

(declare-fun user_eq2 (time_slot_length time_slot_length) Bool)

(declare-const dummy2 time_slot_length)

(declare-datatypes ((time_slot_length__ref 0))
(((time_slot_length__refqtmk (time_slot_length__content time_slot_length)))))
(define-fun time_slot_length__ref_time_slot_length__content__projection ((a time_slot_length__ref)) time_slot_length 
  (time_slot_length__content a))

(define-fun dynamic_invariant2 ((temp___expr_223 (_ BitVec 8))
  (temp___is_init_219 Bool) (temp___skip_constant_220 Bool)
  (temp___do_toplevel_221 Bool)
  (temp___do_typ_inv_222 Bool)) Bool (=>
                                     (or (= temp___is_init_219 true)
                                     (bvule #x00 #x32)) (in_range2
                                     temp___expr_223)))

;; time_below_threshold__post_axiom
  (assert
  (forall
  ((failsafe__model__battery_level_at (Array (_ BitVec 8) battery_level_type)))
  (forall ((failsafe__model__current_time (_ BitVec 8)))
  (! (=> (dynamic_invariant failsafe__model__current_time true true true
     true)
     (let ((result (time_below_threshold failsafe__model__battery_level_at
                   failsafe__model__current_time)))
     (=> (time_below_threshold__function_guard result
     failsafe__model__battery_level_at failsafe__model__current_time)
     (and
     (ite (fp.leq battery_threshold (to_rep
                                    (select failsafe__model__battery_level_at failsafe__model__current_time)))
     (= result #x00)
     (ite (forall ((s (_ BitVec 8)))
          (=> (and (bvule #x00 s) (bvule s #x31))
          (fp.lt (to_rep (select failsafe__model__battery_level_at s)) 
          battery_threshold)))
     (= result #x32)
     (and
     (and (bvult result #x32)
     (fp.leq battery_threshold (to_rep
                               (select failsafe__model__battery_level_at 
                               (let ((temp___230 (bvsub failsafe__model__current_time result)))
                               (ite (bvult failsafe__model__current_time result)
                               (bvadd temp___230 #x32) temp___230))))))
     (ite (bvuge failsafe__model__current_time (bvsub result #x01))
     (forall ((s (_ BitVec 8)))
     (=>
     (and
     (bvule (let ((temp___231 (bvsub failsafe__model__current_time (bvsub result #x01))))
            (ite (bvult failsafe__model__current_time (bvsub result #x01))
            (bvadd temp___231 #x32) temp___231)) s)
     (bvule s failsafe__model__current_time))
     (fp.lt (to_rep (select failsafe__model__battery_level_at s)) battery_threshold)))
     (and
     (forall ((s (_ BitVec 8)))
     (=> (and (bvule #x00 s) (bvule s failsafe__model__current_time))
     (fp.lt (to_rep (select failsafe__model__battery_level_at s)) battery_threshold)))
     (forall ((s (_ BitVec 8)))
     (=>
     (and
     (bvule (let ((temp___232 (bvsub failsafe__model__current_time (bvsub result #x01))))
            (ite (bvult failsafe__model__current_time (bvsub result #x01))
            (bvadd temp___232 #x32) temp___232)) s)
     (bvule s #x31))
     (fp.lt (to_rep (select failsafe__model__battery_level_at s)) battery_threshold))))))))
     (dynamic_invariant2 result true false true true))))) :pattern ((time_below_threshold
                                                                    failsafe__model__battery_level_at
                                                                    failsafe__model__current_time)) ))))

;; is_valid__post_axiom
  (assert true)

(assert
;; defqtvc
 ;; File "test_failsafe.adb", line 3, characters 0-0
  (not
  (forall ((current_time (_ BitVec 8)) (j Int))
  (=> (dynamic_invariant current_time true false true true)
  (=> (= j 1)
  (not (= (and (ite (<= 1 j) true false) (ite (<= j 49) true false)) true)))))))
(check-sat)
(exit)
