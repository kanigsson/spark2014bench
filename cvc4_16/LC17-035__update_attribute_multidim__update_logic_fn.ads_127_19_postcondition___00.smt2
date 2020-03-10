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

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort map1 0)

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content map1)))))
(declare-fun get (map1 Int (_ BitVec 8) Int) integer)

(declare-fun set (map1 Int (_ BitVec 8) Int integer) map1)

;; Select_eq
  (assert
  (forall ((m map1))
  (forall ((i Int))
  (forall ((j (_ BitVec 8)))
  (forall ((k Int))
  (forall ((a integer))
  (! (= (get (set m i j k a) i j k) a) :pattern ((set m i j k a)) )))))))

;; Select_neq
  (assert
  (forall ((m map1))
  (forall ((i Int) (i2 Int))
  (forall ((j (_ BitVec 8)) (j2 (_ BitVec 8)))
  (forall ((k Int) (k2 Int))
  (forall ((a integer))
  (! (=> (not (and (= i i2) (and (= j j2) (= k k2))))
     (= (get (set m i j k a) i2 j2 k2) (get m i2 j2 k2))) :pattern ((get
                                                                    (set m i
                                                                    j k a) i2
                                                                    j2 k2)) :pattern (
  (set m i j k a) (get m i2 j2 k2)) )))))))

(declare-fun slide (map1 Int Int (_ BitVec 8) (_ BitVec 8) Int Int) map1)

;; slide_def
  (assert
  (forall ((a map1))
  (forall ((old_first Int) (new_first Int))
  (forall ((old_first_2 (_ BitVec 8)) (new_first_2 (_ BitVec 8)))
  (forall ((old_first_3 Int) (new_first_3 Int))
  (forall ((i Int))
  (forall ((j (_ BitVec 8)))
  (forall ((k Int))
  (! (= (get
        (slide a old_first new_first old_first_2 new_first_2 old_first_3
        new_first_3) i j k) (get a (- i (- new_first old_first))
                            (bvsub j (bvsub new_first_2 old_first_2))
                            (- k (- new_first_3 old_first_3)))) :pattern (
  (get
  (slide a old_first new_first old_first_2 new_first_2 old_first_3
  new_first_3) i j k)) )))))))))

(define-fun bool_eq ((a map1) (a__first Int) (a__last Int)
  (a__first_2 (_ BitVec 8)) (a__last_2 (_ BitVec 8)) (a__first_3 Int)
  (a__last_3 Int) (b map1) (b__first Int) (b__last Int)
  (b__first_2 (_ BitVec 8)) (b__last_2 (_ BitVec 8)) (b__first_3 Int)
  (b__last_3 Int)) Bool (ite (and
                             (and
                             (and
                             (ite (<= a__first a__last)
                             (and (<= b__first b__last)
                             (= (- a__last a__first) (- b__last b__first)))
                             (< b__last b__first))
                             (ite (bvule a__first_2 a__last_2)
                             (and (bvule b__first_2 b__last_2)
                             (= (bvsub a__last_2 a__first_2) (bvsub b__last_2 b__first_2)))
                             (bvugt b__first_2 b__last_2)))
                             (ite (<= a__first_3 a__last_3)
                             (and (<= b__first_3 b__last_3)
                             (= (- a__last_3 a__first_3) (- b__last_3 b__first_3)))
                             (< b__last_3 b__first_3)))
                             (forall ((temp___idx_156 Int)
                             (temp___idx_158 Int))
                             (forall ((temp___idx_157 (_ BitVec 8)))
                             (=>
                             (and
                             (and
                             (and (<= a__first temp___idx_156)
                             (<= temp___idx_156 a__last))
                             (and (bvule a__first_2 temp___idx_157)
                             (bvule temp___idx_157 a__last_2)))
                             (and (<= a__first_3 temp___idx_158)
                             (<= temp___idx_158 a__last_3)))
                             (= (to_rep
                                (get a temp___idx_156 temp___idx_157
                                temp___idx_158)) (to_rep
                                                 (get b
                                                 (+ (- b__first a__first) temp___idx_156)
                                                 (bvadd (bvsub b__first_2 a__first_2) temp___idx_157)
                                                 (+ (- b__first_3 a__first_3) temp___idx_158))))))))
                        true false))

;; bool_eq_rev
  (assert
  (forall ((a map1) (b map1))
  (forall ((a__first Int) (a__last Int) (a__first_3 Int) (a__last_3 Int)
  (b__first Int) (b__last Int) (b__first_3 Int) (b__last_3 Int))
  (forall ((a__first_2 (_ BitVec 8)) (a__last_2 (_ BitVec 8))
  (b__first_2 (_ BitVec 8)) (b__last_2 (_ BitVec 8)))
  (=>
  (= (bool_eq b b__first b__last b__first_2 b__last_2 b__first_3 b__last_3 a
     a__first a__last a__first_2 a__last_2 a__first_3 a__last_3) true)
  (and
  (and
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (ite (bvule a__first_2 a__last_2)
  (and (bvule b__first_2 b__last_2)
  (= (bvsub a__last_2 a__first_2) (bvsub b__last_2 b__first_2)))
  (bvugt b__first_2 b__last_2)))
  (ite (<= a__first_3 a__last_3)
  (and (<= b__first_3 b__last_3)
  (= (- a__last_3 a__first_3) (- b__last_3 b__first_3)))
  (< b__last_3 b__first_3)))
  (forall ((temp___idx_156 Int) (temp___idx_158 Int))
  (forall ((temp___idx_157 (_ BitVec 8)))
  (=>
  (and
  (and (and (<= a__first temp___idx_156) (<= temp___idx_156 a__last))
  (and (bvule a__first_2 temp___idx_157) (bvule temp___idx_157 a__last_2)))
  (and (<= a__first_3 temp___idx_158) (<= temp___idx_158 a__last_3)))
  (= (to_rep (get a temp___idx_156 temp___idx_157 temp___idx_158)) (to_rep
                                                                   (get b
                                                                   (+ (- b__first a__first) temp___idx_156)
                                                                   (bvadd (bvsub b__first_2 a__first_2) temp___idx_157)
                                                                   (+ (- b__first_3 a__first_3) temp___idx_158)))))))))))))

(declare-const a_3d_arr map1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const x1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const x2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const y1 (_ BitVec 8))

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const y2 (_ BitVec 8))

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const z1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const z2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const v1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const v2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-sort i 0)

(declare-fun iqtint (i) Int)

;; i'axiom
  (assert (forall ((i1 i)) (and (<= 1 (iqtint i1)) (<= (iqtint i1) 10))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

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
                                     (<= 1 10)) (in_range2 temp___expr_172)))

(declare-sort m 0)

(define-fun in_range3 ((x (_ BitVec 8))) Bool (and (bvule #x00 x)
                                              (bvule x #x07)))

(define-fun in_range_int ((x Int)) Bool (and (<= 0 x) (<= x 7)))

(declare-fun attr__ATTRIBUTE_IMAGE3 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) (_ BitVec 8))

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
                                     (bvule #x00 #x07)) (in_range3
                                     temp___expr_179)))

(declare-sort e 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (e e) Bool)

(declare-const dummy3 e)

(declare-datatypes ((e__ref 0))
(((e__refqtmk (e__content e)))))
(define-fun e__ref_e__content__projection ((a e__ref)) e (e__content a))

(define-fun dynamic_invariant3 ((temp___expr_186 Int)
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (=>
                                     (or (= temp___is_init_182 true)
                                     (<= 0 2)) (in_range4 temp___expr_186)))

(declare-fun update_logic_fn__a_3d_arr__aggregate_def (Int) map1)

(declare-fun temp_____aggregate_def_344 (map1 Int (_ BitVec 8) Int Int
  (_ BitVec 8) Int Int Int (_ BitVec 8) Int Int) map1)

;; a_3d_arr__def_axiom
  (assert (= a_3d_arr (update_logic_fn__a_3d_arr__aggregate_def 1000)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 1000))

;; def_axiom
  (assert
  (forall ((temp___164 Int))
  (=> (dynamic_invariant temp___164 true true true true)
  (forall ((temp___165 Int) (temp___167 Int))
  (forall ((temp___166 (_ BitVec 8)))
  (= (get (update_logic_fn__a_3d_arr__aggregate_def temp___164) temp___165
     temp___166 temp___167) rliteral))))))

;; def_axiom
  (assert
  (forall ((temp___346 map1))
  (forall ((temp___347 Int) (temp___349 Int) (temp___350 Int)
  (temp___352 Int) (temp___353 Int) (temp___354 Int) (temp___356 Int)
  (temp___357 Int))
  (forall ((temp___348 (_ BitVec 8)) (temp___351 (_ BitVec 8))
  (temp___355 (_ BitVec 8)))
  (let ((temp___345 (temp_____aggregate_def_344 temp___346 temp___347
                    temp___348 temp___349 temp___350 temp___351 temp___352
                    temp___353 temp___354 temp___355 temp___356 temp___357)))
  (=>
  (and (dynamic_invariant1 temp___347 true true true true)
  (and
  (and
  (and
  (and (dynamic_invariant2 temp___348 true true true true)
  (dynamic_invariant3 temp___349 true true true true)) (dynamic_invariant1
  temp___350 true true true true))
  (and (dynamic_invariant2 temp___351 true true true true)
  (dynamic_invariant3 temp___352 true true true true)))
  (and
  (and
  (and (dynamic_invariant temp___353 true true true true) (dynamic_invariant1
  temp___354 true true true true)) (dynamic_invariant2 temp___355 true true
  true true))
  (and (dynamic_invariant3 temp___356 true true true true) (dynamic_invariant
  temp___357 true true true true)))))
  (forall ((temp___358 Int) (temp___360 Int))
  (forall ((temp___359 (_ BitVec 8)))
  (ite (and (and (= temp___358 temp___354) (= temp___359 temp___355))
       (= temp___360 temp___356))
  (= (to_rep (get temp___345 temp___358 temp___359 temp___360)) temp___357)
  (ite (or
       (and (and (= temp___358 temp___347) (= temp___359 temp___348))
       (= temp___360 temp___349))
       (and (and (= temp___358 temp___350) (= temp___359 temp___351))
       (= temp___360 temp___352)))
  (= (to_rep (get temp___345 temp___358 temp___359 temp___360)) temp___353)
  (= (get temp___345 temp___358 temp___359 temp___360) (get temp___346
                                                       temp___358 temp___359
                                                       temp___360))))))))))))

(assert
;; defqtvc
 ;; File "update_logic_fn.ads", line 121, characters 0-0
  (not
  (forall ((a map1) (o integer) (a1 map1) (o1 integer) (a2 map1))
  (=> (= (update_logic_fn__a_3d_arr__aggregate_def 1000) a_3d_arr)
  (=> (dynamic_invariant1 x1 true false true true)
  (=> (dynamic_invariant1 x2 true false true true)
  (=> (dynamic_invariant2 y1 true false true true)
  (=> (dynamic_invariant2 y2 true false true true)
  (=> (dynamic_invariant3 z1 true false true true)
  (=> (dynamic_invariant3 z2 true false true true)
  (=> (dynamic_invariant v1 true false true true)
  (=> (dynamic_invariant v2 true false true true)
  (=> (= a a_3d_arr)
  (=> (= (to_rep o) v1)
  (=> (= a1 (set a x1 y1 z1 o))
  (=> (= (to_rep o1) v2)
  (=> (= a2 (set a1 x2 y2 z2 o1))
  (=> (= 1 x2)
  (=> (= #x02 y2)
  (=> (= 2 z2)
  (= (bool_eq a2 1 10 #x00 #x07 0 2
     (temp_____aggregate_def_344 a_3d_arr 1 #x02 2 x1 y1 z1 v1 x2 y2 z2 v2) 1
     10 #x00 #x07 0 2) true)))))))))))))))))))))
(check-sat)
(exit)
