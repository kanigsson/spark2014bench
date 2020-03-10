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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort map1 0)

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content map1)))))
(declare-fun get (map1 Int (_ BitVec 8)) integer)

(declare-fun set (map1 Int (_ BitVec 8) integer) map1)

;; Select_eq
  (assert
  (forall ((m map1))
  (forall ((i Int))
  (forall ((j (_ BitVec 8)))
  (forall ((a integer))
  (! (= (get (set m i j a) i j) a) :pattern ((set m i j a)) ))))))

;; Select_neq
  (assert
  (forall ((m map1))
  (forall ((i Int) (i2 Int))
  (forall ((j (_ BitVec 8)) (j2 (_ BitVec 8)))
  (forall ((a integer))
  (! (=> (not (and (= i i2) (= j j2)))
     (= (get (set m i j a) i2 j2) (get m i2 j2))) :pattern ((get
                                                            (set m i j a) i2
                                                            j2)) :pattern (
  (set m i j a) (get m i2 j2)) ))))))

(declare-fun slide (map1 Int Int (_ BitVec 8) (_ BitVec 8)) map1)

;; slide_def
  (assert
  (forall ((a map1))
  (forall ((new_first Int) (old_first Int))
  (forall ((new_first_2 (_ BitVec 8)) (old_first_2 (_ BitVec 8)))
  (forall ((i Int))
  (forall ((j (_ BitVec 8)))
  (! (= (get (slide a old_first new_first old_first_2 new_first_2) i j) 
  (get a (- i (- new_first old_first))
  (bvsub j (bvsub new_first_2 old_first_2)))) :pattern ((get
                                                        (slide a old_first
                                                        new_first old_first_2
                                                        new_first_2) i j)) )))))))

(define-fun bool_eq ((a map1) (a__first Int) (a__last Int)
  (a__first_2 (_ BitVec 8)) (a__last_2 (_ BitVec 8)) (b map1) (b__first Int)
  (b__last Int) (b__first_2 (_ BitVec 8))
  (b__last_2 (_ BitVec 8))) Bool (ite (and
                                      (and
                                      (ite (<= a__first a__last)
                                      (and (<= b__first b__last)
                                      (= (- a__last a__first) (- b__last b__first)))
                                      (< b__last b__first))
                                      (ite (bvule a__first_2 a__last_2)
                                      (and (bvule b__first_2 b__last_2)
                                      (= (bvsub a__last_2 a__first_2) (bvsub b__last_2 b__first_2)))
                                      (bvugt b__first_2 b__last_2)))
                                      (forall ((temp___idx_154 Int))
                                      (forall ((temp___idx_155 (_ BitVec 8)))
                                      (=>
                                      (and
                                      (and (<= a__first temp___idx_154)
                                      (<= temp___idx_154 a__last))
                                      (and (bvule a__first_2 temp___idx_155)
                                      (bvule temp___idx_155 a__last_2)))
                                      (= (to_rep
                                         (get a temp___idx_154
                                         temp___idx_155)) (to_rep
                                                          (get b
                                                          (+ (- b__first a__first) temp___idx_154)
                                                          (bvadd (bvsub b__first_2 a__first_2) temp___idx_155))))))))
                                 true false))

;; bool_eq_rev
  (assert
  (forall ((a map1) (b map1))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (forall ((a__first_2 (_ BitVec 8)) (a__last_2 (_ BitVec 8))
  (b__first_2 (_ BitVec 8)) (b__last_2 (_ BitVec 8)))
  (=>
  (= (bool_eq b b__first b__last b__first_2 b__last_2 a a__first a__last
     a__first_2 a__last_2) true)
  (and
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (ite (bvule a__first_2 a__last_2)
  (and (bvule b__first_2 b__last_2)
  (= (bvsub a__last_2 a__first_2) (bvsub b__last_2 b__first_2)))
  (bvugt b__first_2 b__last_2)))
  (forall ((temp___idx_154 Int))
  (forall ((temp___idx_155 (_ BitVec 8)))
  (=>
  (and (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (and (bvule a__first_2 temp___idx_155) (bvule temp___idx_155 a__last_2)))
  (= (to_rep (get a temp___idx_154 temp___idx_155)) (to_rep
                                                    (get b
                                                    (+ (- b__first a__first) temp___idx_154)
                                                    (bvadd (bvsub b__first_2 a__first_2) temp___idx_155)))))))))))))

(declare-const a_2d_arr map1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const y (_ BitVec 8))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const v1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const v2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-sort i 0)

(declare-fun iqtint (i) Int)

;; i'axiom
  (assert (forall ((i1 i)) (and (<= 1 (iqtint i1)) (<= (iqtint i1) 10))))

(define-fun in_range1 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 10)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (i i) Bool)

(declare-const dummy1 i)

(declare-datatypes ((i__ref 0))
(((i__refqtmk (i__content i)))))
(define-fun i__ref_i__content__projection ((a i__ref)) i (i__content a))

(define-fun dynamic_invariant1 ((temp___expr_172 Int)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (=>
                                     (or (= temp___is_init_168 true)
                                     (<= 1 10)) (in_range1 temp___expr_172)))

(declare-sort m 0)

(define-fun in_range2 ((x1 (_ BitVec 8))) Bool (and (bvule #x00 x1)
                                               (bvule x1 #x07)))

(define-fun in_range_int ((x1 Int)) Bool (and (<= 0 x1) (<= x1 7)))

(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 8))

(declare-fun user_eq2 (m m) Bool)

(declare-const dummy2 m)

(declare-datatypes ((m__ref 0))
(((m__refqtmk (m__content m)))))
(define-fun m__ref_m__content__projection ((a m__ref)) m (m__content a))

(define-fun dynamic_invariant2 ((temp___expr_179 (_ BitVec 8))
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (bvule #x00 #x07)) (in_range2
                                     temp___expr_179)))

(declare-fun update_logic_fn__a_2d_arr__aggregate_def (Int) map1)

(declare-fun temp_____aggregate_def_215 (map1 Int (_ BitVec 8) Int Int
  (_ BitVec 8) Int) map1)

(declare-fun temp_____aggregate_def_390 (map1 Int (_ BitVec 8) Int Int
  (_ BitVec 8) Int) map1)

;; def_axiom
  (assert
  (forall ((temp___392 map1))
  (forall ((temp___393 Int) (temp___395 Int) (temp___396 Int)
  (temp___398 Int))
  (forall ((temp___394 (_ BitVec 8)) (temp___397 (_ BitVec 8)))
  (let ((temp___391 (temp_____aggregate_def_390 temp___392 temp___393
                    temp___394 temp___395 temp___396 temp___397 temp___398)))
  (=>
  (and (dynamic_invariant1 temp___393 true true true true)
  (and
  (and
  (and (dynamic_invariant2 temp___394 true true true true) (dynamic_invariant
  temp___395 true true true true)) (dynamic_invariant1 temp___396 true true
  true true))
  (and (dynamic_invariant2 temp___397 true true true true) (dynamic_invariant
  temp___398 true true true true))))
  (forall ((temp___399 Int))
  (forall ((temp___400 (_ BitVec 8)))
  (ite (and (= temp___399 temp___396) (= temp___400 temp___397))
  (= (to_rep (get temp___391 temp___399 temp___400)) temp___398)
  (ite (and (= temp___399 temp___393) (= temp___400 temp___394))
  (= (to_rep (get temp___391 temp___399 temp___400)) temp___395)
  (= (get temp___391 temp___399 temp___400) (get temp___392 temp___399
                                            temp___400))))))))))))

;; a_2d_arr__def_axiom
  (assert (= a_2d_arr (update_logic_fn__a_2d_arr__aggregate_def 100)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 100))

;; def_axiom
  (assert
  (forall ((temp___160 Int))
  (=> (dynamic_invariant temp___160 true true true true)
  (forall ((temp___161 Int))
  (forall ((temp___162 (_ BitVec 8)))
  (= (get (update_logic_fn__a_2d_arr__aggregate_def temp___160) temp___161
     temp___162) rliteral))))))

;; def_axiom
  (assert
  (forall ((temp___217 map1))
  (forall ((temp___218 Int) (temp___220 Int) (temp___221 Int)
  (temp___223 Int))
  (forall ((temp___219 (_ BitVec 8)) (temp___222 (_ BitVec 8)))
  (let ((temp___216 (temp_____aggregate_def_215 temp___217 temp___218
                    temp___219 temp___220 temp___221 temp___222 temp___223)))
  (=>
  (and (dynamic_invariant1 temp___218 true true true true)
  (and
  (and
  (and (dynamic_invariant2 temp___219 true true true true) (dynamic_invariant
  temp___220 true true true true)) (dynamic_invariant1 temp___221 true true
  true true))
  (and (dynamic_invariant2 temp___222 true true true true) (dynamic_invariant
  temp___223 true true true true))))
  (forall ((temp___224 Int))
  (forall ((temp___225 (_ BitVec 8)))
  (ite (and (= temp___224 temp___221) (= temp___225 temp___222))
  (= (to_rep (get temp___216 temp___224 temp___225)) temp___223)
  (ite (and (= temp___224 temp___218) (= temp___225 temp___219))
  (= (to_rep (get temp___216 temp___224 temp___225)) temp___220)
  (= (get temp___216 temp___224 temp___225) (get temp___217 temp___224
                                            temp___225))))))))))))

(assert
;; defqtvc
 ;; File "update_logic_fn.ads", line 23, characters 0-0
  (not
  (forall ((a map1))
  (=> (= (update_logic_fn__a_2d_arr__aggregate_def 100) a_2d_arr)
  (=> (dynamic_invariant1 x true false true true)
  (=> (dynamic_invariant2 y true false true true)
  (=> (dynamic_invariant v1 true false true true)
  (=> (dynamic_invariant v2 true false true true)
  (=> (= a (temp_____aggregate_def_390 a_2d_arr 5 #x07 v1 x y v2))
  (= (bool_eq a 1 10 #x00 #x07
     (temp_____aggregate_def_215 a_2d_arr 5 #x07 v1 x y v2) 1 10 #x00 #x07) true))))))))))
(check-sat)
(exit)
