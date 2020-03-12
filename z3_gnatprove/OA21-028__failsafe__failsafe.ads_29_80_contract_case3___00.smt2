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

(declare-fun rotate_right1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_left1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 8))) Int (ite (bvsge x (_ bv0 8))
                                           (bv2int x) (- (- 256 (bv2int x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 255)))

(declare-fun nth_bv ((_ BitVec 8) (_ BitVec 8)) Bool)

(declare-fun eq_sub_bv ((_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) Bool)

(define-fun eq_sub ((a (_ BitVec 8)) (b (_ BitVec 8)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content (_ BitVec 8))))))
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
(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-const battery_threshold Float32)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort battery_level_type 0)

(declare-fun user_eq (battery_level_type battery_level_type) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float32)

(declare-const dummy battery_level_type)

(declare-datatypes ()
((battery_level_type__ref
 (battery_level_type__refqtmk
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

(declare-datatypes ()
((map__ref
 (map__refqtmk (map__content (Array (_ BitVec 8) battery_level_type))))))
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
                                    (forall ((temp___idx_154 (_ BitVec 8)))
                                    (=>
                                    (and (bvule a__first temp___idx_154)
                                    (bvule temp___idx_154 a__last))
                                    (fp.eq (to_rep (select a temp___idx_154)) 
                                    (to_rep
                                    (select b (bvadd (bvsub b__first a__first) temp___idx_154)))))))
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
  (forall ((temp___idx_154 (_ BitVec 8)))
  (=> (and (bvule a__first temp___idx_154) (bvule temp___idx_154 a__last))
  (fp.eq (to_rep (select a temp___idx_154)) (to_rep
                                            (select b (bvadd (bvsub b__first a__first) temp___idx_154)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_invariant ((temp___expr_162 Float32)
  (temp___is_init_158 Bool) (temp___skip_constant_159 Bool)
  (temp___do_toplevel_160 Bool)
  (temp___do_typ_inv_161 Bool)) Bool (=>
                                     (or (= temp___is_init_158 true)
                                     (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                     (fp.isFinite32 temp___expr_162)))

(declare-sort time_slot 0)

(define-fun in_range1 ((x (_ BitVec 8))) Bool (and (bvule #x00 x)
                                              (bvule x #x31)))

(define-fun in_range_int ((x Int)) Bool (and (<= 0 x) (<= x 49)))

(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 8))

(declare-fun user_eq1 (time_slot time_slot) Bool)

(declare-const dummy1 time_slot)

(declare-datatypes ()
((time_slot__ref (time_slot__refqtmk (time_slot__content time_slot)))))
(define-fun time_slot__ref_time_slot__content__projection ((a time_slot__ref)) time_slot 
  (time_slot__content a))

(define-fun dynamic_invariant1 ((temp___expr_169 (_ BitVec 8))
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (=>
                                     (or (= temp___is_init_165 true)
                                     (bvule #x00 #x31)) (in_range1
                                     temp___expr_169)))

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

(declare-datatypes ()
((time_slot_length__ref
 (time_slot_length__refqtmk (time_slot_length__content time_slot_length)))))
(define-fun time_slot_length__ref_time_slot_length__content__projection ((a time_slot_length__ref)) time_slot_length 
  (time_slot_length__content a))

(define-fun dynamic_invariant2 ((temp___expr_183 (_ BitVec 8))
  (temp___is_init_179 Bool) (temp___skip_constant_180 Bool)
  (temp___do_toplevel_181 Bool)
  (temp___do_typ_inv_182 Bool)) Bool (=>
                                     (or (= temp___is_init_179 true)
                                     (bvule #x00 #x32)) (in_range2
                                     temp___expr_183)))

;; battery_threshold__def_axiom
  (assert
  (= battery_threshold (fp #b0 #b01111100 #b10011001100110011001101)))

(declare-const battery_level_at (Array (_ BitVec 8) battery_level_type))

(declare-const current_time (_ BitVec 8))

;; Assume
  (assert (dynamic_invariant battery_threshold true false true true))

;; Assume
  (assert
  (= (fp #b0 #b01111100 #b10011001100110011001101) battery_threshold))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 current_time true false true true))

(define-fun usf () Bool (fp.geq (to_rep
                                (select battery_level_at current_time)) 
  battery_threshold))

(define-fun usf1 () Bool (ite (forall ((s (_ BitVec 8)))
                              (=> (and (bvule #x00 s) (bvule s #x31))
                              (fp.lt (to_rep (select battery_level_at s)) 
                              battery_threshold)))
                         true false))

(declare-const res (_ BitVec 8))

;; H
  (assert (= res #x00))

;; Assume
  (assert (dynamic_invariant2 res true false true true))

(declare-const s (_ BitVec 8))

;; H
  (assert (= s #x00))

(declare-const res1 (_ BitVec 8))

;; H
  (assert
  (ite (= (and (ite (bvule #x00 s) true false) (ite (bvule s #x31) true
                                               false)) true)
  (exists ((o (_ BitVec 8)))
  (and
  (let ((temp___238 (bvsub current_time s)))
  (ite (bvult current_time s) (= o (bvadd temp___238 #x32)) (= o temp___238)))
  (exists ((o1 Float32))
  (and (= (to_rep (select battery_level_at o)) o1)
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (fp.lt o1 battery_threshold) true false))
  (ite (= spark__branch true)
  (let ((o2 (bvadd res #x01)))
  (and (in_range2 o2)
  (exists ((res2 (_ BitVec 8)))
  (and (= res2 o2)
  (and (and (bvule #x01 res2) (bvule res2 #x32))
  (and
  (let ((o3 (bvsub res2 #x01)))
  (and (in_range1 o3)
  (ite (bvuge current_time o3)
  (exists ((o4 (_ BitVec 8)))
  (let ((o5 (bvsub res2 #x01)))
  (and (in_range1 o5)
  (let ((temp___243 (bvsub current_time o5)))
  (let ((o6 (bvsub res2 #x01)))
  (and (in_range1 o6)
  (ite (bvult current_time o6) (= o4 (bvadd temp___243 #x32))
  (= o4 temp___243))))))))
  (or
  (not
  (forall ((s1 (_ BitVec 8)))
  (=> (and (bvule #x00 s1) (bvule s1 current_time))
  (fp.lt (to_rep (select battery_level_at s1)) battery_threshold))))
  (exists ((o4 (_ BitVec 8)))
  (let ((o5 (bvsub res2 #x01)))
  (and (in_range1 o5)
  (let ((temp___245 (bvsub current_time o5)))
  (let ((o6 (bvsub res2 #x01)))
  (and (in_range1 o6)
  (ite (bvult current_time o6) (= o4 (bvadd temp___245 #x32))
  (= o4 temp___245))))))))))))
  (exists ((s1 (_ BitVec 8)))
  (and
  (and
  (ite (bvuge current_time (bvsub res1 #x01))
  (forall ((s2 (_ BitVec 8)))
  (=>
  (and
  (bvule (let ((temp___247 (bvsub current_time (bvsub res1 #x01))))
         (ite (bvult current_time (bvsub res1 #x01)) (bvadd temp___247 #x32)
         temp___247)) s2)
  (bvule s2 current_time))
  (fp.lt (to_rep (select battery_level_at s2)) battery_threshold)))
  (and
  (forall ((s2 (_ BitVec 8)))
  (=> (and (bvule #x00 s2) (bvule s2 current_time))
  (fp.lt (to_rep (select battery_level_at s2)) battery_threshold)))
  (forall ((s2 (_ BitVec 8)))
  (=>
  (and
  (bvule (let ((temp___248 (bvsub current_time (bvsub res1 #x01))))
         (ite (bvult current_time (bvsub res1 #x01)) (bvadd temp___248 #x32)
         temp___248)) s2)
  (bvule s2 #x31))
  (fp.lt (to_rep (select battery_level_at s2)) battery_threshold)))))
  (= res1 (bvadd s1 #x01)))
  (and
  (= (and (ite (and (dynamic_invariant2 res1 true true true true) (in_range1
               s1))
          true false) (ite (and (bvule #x00 s1) (bvule s1 #x31)) true false)) true)
  (or (= s1 #x31)
  (exists ((s2 (_ BitVec 8)))
  (and (= s2 (bvadd s1 #x01))
  (exists ((o3 (_ BitVec 8)))
  (and
  (let ((temp___238 (bvsub current_time s2)))
  (ite (bvult current_time s2) (= o3 (bvadd temp___238 #x32))
  (= o3 temp___238)))
  (exists ((o4 Float32))
  (and (= (to_rep (select battery_level_at o3)) o4)
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (ite (fp.lt o4 battery_threshold) true false))
  (not (= spark__branch1 true)))))))))))))))))))) (= res1 res))))))))
  (= res1 res)))

(declare-const failsafe__model__time_below_threshold__result (_ BitVec 8))

;; H
  (assert (= failsafe__model__time_below_threshold__result res1))

;; Assert
  (assert
  (=> (= usf true) (= failsafe__model__time_below_threshold__result #x00)))

;; H
  (assert
  (forall ((s1 (_ BitVec 8)))
  (=> (and (bvule #x00 s1) (bvule s1 #x31))
  (fp.lt (to_rep (select battery_level_at s1)) battery_threshold))))

(assert
;; defqtvc
 ;; File "failsafe.ads", line 22, characters 0-0
  (not (= failsafe__model__time_below_threshold__result #x32)))
(check-sat)
