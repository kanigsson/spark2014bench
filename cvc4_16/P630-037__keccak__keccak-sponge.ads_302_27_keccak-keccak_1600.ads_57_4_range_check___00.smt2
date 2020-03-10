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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

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

(declare-fun nth1 ((_ BitVec 64) Int) Bool)

(declare-fun lsr1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun asr1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun lsl1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun rotate_right2 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun rotate_left2 ((_ BitVec 64) Int) (_ BitVec 64))

(define-fun to_int2 ((x (_ BitVec 64))) Int (ite (bvsge x (_ bv0 64))
                                            (bv2nat x)
                                            (- (- 18446744073709551616 (bv2nat x)))))

(define-fun uint_in_range1 ((i Int)) Bool (and (<= 0 i)
                                          (<= i 18446744073709551615)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvlshr x n) (lsr1 x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvashr x n) (asr1 x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvshl x n) (lsl1 x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvor (bvshl v (bvurem n (_ bv64 64))) (bvlshr v (bvsub (_ bv64 64) (bvurem n (_ bv64 64))))) 
  (rotate_left2 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvor (bvlshr v (bvurem n (_ bv64 64))) (bvshl v (bvsub (_ bv64 64) (bvurem n (_ bv64 64))))) 
  (rotate_right2 v (bv2nat n)))))

(declare-fun nth_bv1 ((_ BitVec 64) (_ BitVec 64)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 64)) (i (_ BitVec 64)))
  (= (= (nth_bv1 x i) true)
  (not (= (bvand (bvlshr x i) #x0000000000000001) #x0000000000000000)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 64)) (i (_ BitVec 64)))
  (= (nth1 x (bv2nat i)) (nth_bv1 x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 64)) (i Int))
  (=> (and (<= 0 i) (< i 18446744073709551616))
  (= (nth_bv1 x ((_ int2bv 64) i)) (nth1 x i)))))

(declare-fun eq_sub_bv1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)
  (_ BitVec 64)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 64)) (b (_ BitVec 64)) (i (_ BitVec 64))
  (n (_ BitVec 64)))
  (let ((mask (bvshl (bvsub (bvshl #x0000000000000001 n) #x0000000000000001) i)))
  (= (eq_sub_bv1 a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub1 ((a (_ BitVec 64)) (b (_ BitVec 64)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth1 a j) (nth1 b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 64)) (b (_ BitVec 64)) (i (_ BitVec 64))
  (n (_ BitVec 64)))
  (= (eq_sub1 a b (bv2nat i) (bv2nat n)) (eq_sub_bv1 a b i n))))

(declare-datatypes ((t__ref1 0))
(((t__refqtmk1 (t__content1 (_ BitVec 64))))))
(declare-fun power1 ((_ BitVec 64) Int) (_ BitVec 64))

(define-fun bv_min1 ((x (_ BitVec 64))
  (y (_ BitVec 64))) (_ BitVec 64) (ite (bvule x y) x y))

(define-fun bv_max1 ((x (_ BitVec 64))
  (y (_ BitVec 64))) (_ BitVec 64) (ite (bvule x y) y x))

(declare-sort lane_type 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 64))

(declare-fun user_eq2 (lane_type lane_type) Bool)

(declare-const dummy2 lane_type)

(declare-datatypes ((lane_type__ref 0))
(((lane_type__refqtmk (lane_type__content lane_type)))))
(define-fun lane_type__ref_lane_type__content__projection ((a lane_type__ref)) lane_type 
  (lane_type__content a))

(declare-fun to_rep (lane_type) (_ BitVec 64))

(declare-fun of_rep ((_ BitVec 64)) lane_type)

;; inversion_axiom
  (assert
  (forall ((x lane_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 64)))
  (! (= (to_rep (of_rep x)) x) :pattern ((to_rep (of_rep x))) )))

(define-fun to_int3 ((x lane_type)) Int (bv2nat (to_rep x)))

;; range_int_axiom
  (assert
  (forall ((x lane_type)) (! (uint_in_range1
  (to_int3 x)) :pattern ((to_int3 x)) )))

(declare-sort map1 0)

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content map1)))))
(declare-fun get (map1 (_ BitVec 8) (_ BitVec 8)) lane_type)

(declare-fun set (map1 (_ BitVec 8) (_ BitVec 8) lane_type) map1)

;; Select_eq
  (assert
  (forall ((m map1))
  (forall ((i (_ BitVec 8)))
  (forall ((j (_ BitVec 8)))
  (forall ((a lane_type))
  (! (= (get (set m i j a) i j) a) :pattern ((set m i j a)) ))))))

;; Select_neq
  (assert
  (forall ((m map1))
  (forall ((i (_ BitVec 8)) (i2 (_ BitVec 8)))
  (forall ((j (_ BitVec 8)) (j2 (_ BitVec 8)))
  (forall ((a lane_type))
  (! (=> (not (and (= i i2) (= j j2)))
     (= (get (set m i j a) i2 j2) (get m i2 j2))) :pattern ((get
                                                            (set m i j a) i2
                                                            j2)) :pattern (
  (set m i j a) (get m i2 j2)) ))))))

(declare-fun slide (map1 (_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) map1)

;; slide_def
  (assert
  (forall ((a map1))
  (forall ((new_first (_ BitVec 8)) (old_first (_ BitVec 8)))
  (forall ((new_first_2 (_ BitVec 8)) (old_first_2 (_ BitVec 8)))
  (forall ((i (_ BitVec 8)))
  (forall ((j (_ BitVec 8)))
  (! (= (get (slide a old_first new_first old_first_2 new_first_2) i j) 
  (get a (bvsub i (bvsub new_first old_first))
  (bvsub j (bvsub new_first_2 old_first_2)))) :pattern ((get
                                                        (slide a old_first
                                                        new_first old_first_2
                                                        new_first_2) i j)) )))))))

(define-fun bool_eq ((a map1) (a__first (_ BitVec 8)) (a__last (_ BitVec 8))
  (a__first_2 (_ BitVec 8)) (a__last_2 (_ BitVec 8)) (b map1)
  (b__first (_ BitVec 8)) (b__last (_ BitVec 8)) (b__first_2 (_ BitVec 8))
  (b__last_2 (_ BitVec 8))) Bool (ite (and
                                      (and
                                      (ite (bvule a__first a__last)
                                      (and (bvule b__first b__last)
                                      (= (bvsub a__last a__first) (bvsub b__last b__first)))
                                      (bvugt b__first b__last))
                                      (ite (bvule a__first_2 a__last_2)
                                      (and (bvule b__first_2 b__last_2)
                                      (= (bvsub a__last_2 a__first_2) (bvsub b__last_2 b__first_2)))
                                      (bvugt b__first_2 b__last_2)))
                                      (forall ((temp___idx_154 (_ BitVec 8))
                                      (temp___idx_155 (_ BitVec 8)))
                                      (=>
                                      (and
                                      (and (bvule a__first temp___idx_154)
                                      (bvule temp___idx_154 a__last))
                                      (and (bvule a__first_2 temp___idx_155)
                                      (bvule temp___idx_155 a__last_2)))
                                      (= (to_rep
                                         (get a temp___idx_154
                                         temp___idx_155)) (to_rep
                                                          (get b
                                                          (bvadd (bvsub b__first a__first) temp___idx_154)
                                                          (bvadd (bvsub b__first_2 a__first_2) temp___idx_155)))))))
                                 true false))

;; bool_eq_rev
  (assert
  (forall ((a map1) (b map1))
  (forall ((a__first (_ BitVec 8)) (a__last (_ BitVec 8))
  (a__first_2 (_ BitVec 8)) (a__last_2 (_ BitVec 8)) (b__first (_ BitVec 8))
  (b__last (_ BitVec 8)) (b__first_2 (_ BitVec 8)) (b__last_2 (_ BitVec 8)))
  (=>
  (= (bool_eq b b__first b__last b__first_2 b__last_2 a a__first a__last
     a__first_2 a__last_2) true)
  (and
  (and
  (ite (bvule a__first a__last)
  (and (bvule b__first b__last)
  (= (bvsub a__last a__first) (bvsub b__last b__first)))
  (bvugt b__first b__last))
  (ite (bvule a__first_2 a__last_2)
  (and (bvule b__first_2 b__last_2)
  (= (bvsub a__last_2 a__first_2) (bvsub b__last_2 b__first_2)))
  (bvugt b__first_2 b__last_2)))
  (forall ((temp___idx_154 (_ BitVec 8)) (temp___idx_155 (_ BitVec 8)))
  (=>
  (and (and (bvule a__first temp___idx_154) (bvule temp___idx_154 a__last))
  (and (bvule a__first_2 temp___idx_155) (bvule temp___idx_155 a__last_2)))
  (= (to_rep (get a temp___idx_154 temp___idx_155)) (to_rep
                                                    (get b
                                                    (bvadd (bvsub b__first a__first) temp___idx_154)
                                                    (bvadd (bvsub b__first_2 a__first_2) temp___idx_155)))))))))))

(declare-const dummy3 map1)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq3 (map1 map1) Bool)

(declare-sort states 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (states states) Bool)

(declare-const dummy4 states)

(declare-datatypes ((states__ref 0))
(((states__refqtmk (states__content states)))))
(define-fun states__ref_states__content__projection ((a states__ref)) states 
  (states__content a))

(declare-fun to_rep1 (states) Int)

(declare-fun of_rep1 (Int) states)

;; inversion_axiom
  (assert
  (forall ((x states))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x states)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort byte_absorption_number 0)

(declare-fun byte_absorption_numberqtint (byte_absorption_number) Int)

;; byte_absorption_number'axiom
  (assert
  (forall ((i byte_absorption_number))
  (and (<= 0 (byte_absorption_numberqtint i))
  (<= (byte_absorption_numberqtint i) 199))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 199)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (byte_absorption_number byte_absorption_number) Bool)

(declare-const dummy5 byte_absorption_number)

(declare-datatypes ((byte_absorption_number__ref 0))
(((byte_absorption_number__refqtmk
  (byte_absorption_number__content byte_absorption_number)))))
(define-fun byte_absorption_number__ref_byte_absorption_number__content__projection ((a byte_absorption_number__ref)) byte_absorption_number 
  (byte_absorption_number__content a))

(define-fun to_rep2 ((x byte_absorption_number)) Int (byte_absorption_numberqtint
                                                     x))

(declare-fun of_rep2 (Int) byte_absorption_number)

;; inversion_axiom
  (assert
  (forall ((x byte_absorption_number))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x byte_absorption_number)) (! (in_range3
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort byte 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE5 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) (_ BitVec 8))

(declare-fun user_eq6 (byte byte) Bool)

(declare-const dummy6 byte)

(declare-datatypes ((byte__ref 0))
(((byte__refqtmk (byte__content byte)))))
(define-fun byte__ref_byte__content__projection ((a byte__ref)) byte 
  (byte__content a))

(declare-fun to_rep3 (byte) (_ BitVec 8))

(declare-fun of_rep3 ((_ BitVec 8)) byte)

;; inversion_axiom
  (assert
  (forall ((x byte)) (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (= (to_rep3 (of_rep3 x)) x) :pattern ((to_rep3 (of_rep3 x))) )))

(define-fun to_int4 ((x byte)) Int (bv2nat (to_rep3 x)))

;; range_int_axiom
  (assert
  (forall ((x byte)) (! (uint_in_range (to_int4 x)) :pattern ((to_int4 x)) )))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int byte))))))
(declare-fun slide1 ((Array Int byte) Int Int) (Array Int byte))

;; slide_eq
  (assert
  (forall ((a (Array Int byte)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int byte)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int byte)) (a__first Int) (a__last Int)
  (b (Array Int byte)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_183 Int))
                           (=>
                           (and (<= a__first temp___idx_183)
                           (<= temp___idx_183 a__last))
                           (= (to_rep3 (select a temp___idx_183)) (to_rep3
                                                                  (select b (+ (- b__first a__first) temp___idx_183)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int byte)) (b (Array Int byte)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_183 Int))
  (=> (and (<= a__first temp___idx_183) (<= temp___idx_183 a__last))
  (= (to_rep3 (select a temp___idx_183)) (to_rep3
                                         (select b (+ (- b__first a__first) temp___idx_183)))))))))))

(declare-const dummy7 (Array Int byte))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq7 ((Array Int byte) (Array Int byte)) Bool)

(declare-sort bit_absorption_number 0)

(declare-fun bit_absorption_numberqtint (bit_absorption_number) Int)

;; bit_absorption_number'axiom
  (assert
  (forall ((i bit_absorption_number))
  (and (<= 0 (bit_absorption_numberqtint i))
  (<= (bit_absorption_numberqtint i) 1599))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 1599)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq8 (bit_absorption_number bit_absorption_number) Bool)

(declare-const dummy8 bit_absorption_number)

(declare-datatypes ((bit_absorption_number__ref 0))
(((bit_absorption_number__refqtmk
  (bit_absorption_number__content bit_absorption_number)))))
(define-fun bit_absorption_number__ref_bit_absorption_number__content__projection ((a bit_absorption_number__ref)) bit_absorption_number 
  (bit_absorption_number__content a))

(define-fun to_rep4 ((x bit_absorption_number)) Int (bit_absorption_numberqtint
                                                    x))

(declare-fun of_rep4 (Int) bit_absorption_number)

;; inversion_axiom
  (assert
  (forall ((x bit_absorption_number))
  (! (= (of_rep4 (to_rep4 x)) x) :pattern ((to_rep4 x)) )))

;; range_axiom
  (assert
  (forall ((x bit_absorption_number)) (! (in_range4
  (to_rep4 x)) :pattern ((to_rep4 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep4 (of_rep4 x)) x)) :pattern ((to_rep4
                                                              (of_rep4 x))) )))

(declare-sort rate_number 0)

(declare-fun rate_numberqtint (rate_number) Int)

;; rate_number'axiom
  (assert
  (forall ((i rate_number))
  (and (<= 1 (rate_numberqtint i)) (<= (rate_numberqtint i) 199))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 199)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq9 (rate_number rate_number) Bool)

(declare-const dummy9 rate_number)

(declare-datatypes ((rate_number__ref 0))
(((rate_number__refqtmk (rate_number__content rate_number)))))
(define-fun rate_number__ref_rate_number__content__projection ((a rate_number__ref)) rate_number 
  (rate_number__content a))

(define-fun to_rep5 ((x rate_number)) Int (rate_numberqtint x))

(declare-fun of_rep5 (Int) rate_number)

;; inversion_axiom
  (assert
  (forall ((x rate_number))
  (! (= (of_rep5 (to_rep5 x)) x) :pattern ((to_rep5 x)) )))

;; range_axiom
  (assert
  (forall ((x rate_number)) (! (in_range5
  (to_rep5 x)) :pattern ((to_rep5 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range5 x) (= (to_rep5 (of_rep5 x)) x)) :pattern ((to_rep5
                                                              (of_rep5 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__ada___keccak__keccak_1600__sponge__context__state map1)(rec__ada___keccak__keccak_1600__sponge__context__block (Array Int byte))(rec__ada___keccak__keccak_1600__sponge__context__bits_absorbed bit_absorption_number)(rec__ada___keccak__keccak_1600__sponge__context__bytes_squeezed byte_absorption_number)(rec__ada___keccak__keccak_1600__sponge__context__rate rate_number)(rec__ada___keccak__keccak_1600__sponge__context__curr_state states)))))
(define-fun us_split_fields_rec__ada___keccak__keccak_1600__sponge__context__state__projection ((a us_split_fields)) map1 
  (rec__ada___keccak__keccak_1600__sponge__context__state a))

(define-fun us_split_fields_rec__ada___keccak__keccak_1600__sponge__context__block__projection ((a us_split_fields)) (Array Int byte) 
  (rec__ada___keccak__keccak_1600__sponge__context__block a))

(define-fun us_split_fields_rec__ada___keccak__keccak_1600__sponge__context__bits_absorbed__projection ((a us_split_fields)) bit_absorption_number 
  (rec__ada___keccak__keccak_1600__sponge__context__bits_absorbed a))

(define-fun us_split_fields_rec__ada___keccak__keccak_1600__sponge__context__bytes_squeezed__projection ((a us_split_fields)) byte_absorption_number 
  (rec__ada___keccak__keccak_1600__sponge__context__bytes_squeezed a))

(define-fun us_split_fields_rec__ada___keccak__keccak_1600__sponge__context__rate__projection ((a us_split_fields)) rate_number 
  (rec__ada___keccak__keccak_1600__sponge__context__rate a))

(define-fun us_split_fields_rec__ada___keccak__keccak_1600__sponge__context__curr_state__projection ((a us_split_fields)) states 
  (rec__ada___keccak__keccak_1600__sponge__context__curr_state a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (bool_eq
                           (rec__ada___keccak__keccak_1600__sponge__context__state
                           (us_split_fields1 a)) #x00 #x04 #x00 #x04
                           (rec__ada___keccak__keccak_1600__sponge__context__state
                           (us_split_fields1 b)) #x00 #x04 #x00 #x04) true)
                        (= (bool_eq1
                           (rec__ada___keccak__keccak_1600__sponge__context__block
                           (us_split_fields1 a)) 0 199
                           (rec__ada___keccak__keccak_1600__sponge__context__block
                           (us_split_fields1 b)) 0 199) true))
                        (and
                        (and
                        (= (to_rep4
                           (rec__ada___keccak__keccak_1600__sponge__context__bits_absorbed
                           (us_split_fields1 a))) (to_rep4
                                                  (rec__ada___keccak__keccak_1600__sponge__context__bits_absorbed
                                                  (us_split_fields1 b))))
                        (= (to_rep2
                           (rec__ada___keccak__keccak_1600__sponge__context__bytes_squeezed
                           (us_split_fields1 a))) (to_rep2
                                                  (rec__ada___keccak__keccak_1600__sponge__context__bytes_squeezed
                                                  (us_split_fields1 b)))))
                        (and
                        (= (to_rep5
                           (rec__ada___keccak__keccak_1600__sponge__context__rate
                           (us_split_fields1 a))) (to_rep5
                                                  (rec__ada___keccak__keccak_1600__sponge__context__rate
                                                  (us_split_fields1 b))))
                        (= (to_rep1
                           (rec__ada___keccak__keccak_1600__sponge__context__curr_state
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__ada___keccak__keccak_1600__sponge__context__curr_state
                                                  (us_split_fields1 b)))))))
                   true false))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const ada___keccak__keccak_1600__sponge__context__state__first__bit Int)

(declare-const ada___keccak__keccak_1600__sponge__context__state__last__bit Int)

(declare-const ada___keccak__keccak_1600__sponge__context__state__position Int)

;; ada___keccak__keccak_1600__sponge__context__state__first__bit_axiom
  (assert
  (<= 0 ada___keccak__keccak_1600__sponge__context__state__first__bit))

;; ada___keccak__keccak_1600__sponge__context__state__last__bit_axiom
  (assert
  (< ada___keccak__keccak_1600__sponge__context__state__first__bit ada___keccak__keccak_1600__sponge__context__state__last__bit))

;; ada___keccak__keccak_1600__sponge__context__state__position_axiom
  (assert (<= 0 ada___keccak__keccak_1600__sponge__context__state__position))

(declare-const ada___keccak__keccak_1600__sponge__context__block__first__bit Int)

(declare-const ada___keccak__keccak_1600__sponge__context__block__last__bit Int)

(declare-const ada___keccak__keccak_1600__sponge__context__block__position Int)

;; ada___keccak__keccak_1600__sponge__context__block__first__bit_axiom
  (assert
  (<= 0 ada___keccak__keccak_1600__sponge__context__block__first__bit))

;; ada___keccak__keccak_1600__sponge__context__block__last__bit_axiom
  (assert
  (< ada___keccak__keccak_1600__sponge__context__block__first__bit ada___keccak__keccak_1600__sponge__context__block__last__bit))

;; ada___keccak__keccak_1600__sponge__context__block__position_axiom
  (assert (<= 0 ada___keccak__keccak_1600__sponge__context__block__position))

(declare-const ada___keccak__keccak_1600__sponge__context__bits_absorbed__first__bit Int)

(declare-const ada___keccak__keccak_1600__sponge__context__bits_absorbed__last__bit Int)

(declare-const ada___keccak__keccak_1600__sponge__context__bits_absorbed__position Int)

;; ada___keccak__keccak_1600__sponge__context__bits_absorbed__first__bit_axiom
  (assert
  (<= 0 ada___keccak__keccak_1600__sponge__context__bits_absorbed__first__bit))

;; ada___keccak__keccak_1600__sponge__context__bits_absorbed__last__bit_axiom
  (assert
  (< ada___keccak__keccak_1600__sponge__context__bits_absorbed__first__bit 
  ada___keccak__keccak_1600__sponge__context__bits_absorbed__last__bit))

;; ada___keccak__keccak_1600__sponge__context__bits_absorbed__position_axiom
  (assert
  (<= 0 ada___keccak__keccak_1600__sponge__context__bits_absorbed__position))

(declare-const ada___keccak__keccak_1600__sponge__context__bytes_squeezed__first__bit Int)

(declare-const ada___keccak__keccak_1600__sponge__context__bytes_squeezed__last__bit Int)

(declare-const ada___keccak__keccak_1600__sponge__context__bytes_squeezed__position Int)

;; ada___keccak__keccak_1600__sponge__context__bytes_squeezed__first__bit_axiom
  (assert
  (<= 0 ada___keccak__keccak_1600__sponge__context__bytes_squeezed__first__bit))

;; ada___keccak__keccak_1600__sponge__context__bytes_squeezed__last__bit_axiom
  (assert
  (< ada___keccak__keccak_1600__sponge__context__bytes_squeezed__first__bit 
  ada___keccak__keccak_1600__sponge__context__bytes_squeezed__last__bit))

;; ada___keccak__keccak_1600__sponge__context__bytes_squeezed__position_axiom
  (assert
  (<= 0 ada___keccak__keccak_1600__sponge__context__bytes_squeezed__position))

(declare-const ada___keccak__keccak_1600__sponge__context__rate__first__bit Int)

(declare-const ada___keccak__keccak_1600__sponge__context__rate__last__bit Int)

(declare-const ada___keccak__keccak_1600__sponge__context__rate__position Int)

;; ada___keccak__keccak_1600__sponge__context__rate__first__bit_axiom
  (assert
  (<= 0 ada___keccak__keccak_1600__sponge__context__rate__first__bit))

;; ada___keccak__keccak_1600__sponge__context__rate__last__bit_axiom
  (assert
  (< ada___keccak__keccak_1600__sponge__context__rate__first__bit ada___keccak__keccak_1600__sponge__context__rate__last__bit))

;; ada___keccak__keccak_1600__sponge__context__rate__position_axiom
  (assert (<= 0 ada___keccak__keccak_1600__sponge__context__rate__position))

(declare-const ada___keccak__keccak_1600__sponge__context__curr_state__first__bit Int)

(declare-const ada___keccak__keccak_1600__sponge__context__curr_state__last__bit Int)

(declare-const ada___keccak__keccak_1600__sponge__context__curr_state__position Int)

;; ada___keccak__keccak_1600__sponge__context__curr_state__first__bit_axiom
  (assert
  (<= 0 ada___keccak__keccak_1600__sponge__context__curr_state__first__bit))

;; ada___keccak__keccak_1600__sponge__context__curr_state__last__bit_axiom
  (assert
  (< ada___keccak__keccak_1600__sponge__context__curr_state__first__bit 
  ada___keccak__keccak_1600__sponge__context__curr_state__last__bit))

;; ada___keccak__keccak_1600__sponge__context__curr_state__position_axiom
  (assert
  (<= 0 ada___keccak__keccak_1600__sponge__context__curr_state__position))

(declare-fun user_eq10 (us_rep us_rep) Bool)

(declare-const dummy10 us_rep)

(declare-datatypes ((context__ref 0))
(((context__refqtmk (context__content us_rep)))))
(define-fun context__ref_context__content__projection ((a context__ref)) us_rep 
  (context__content a))

(declare-const ctx us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_273 (_ BitVec 8))
  (temp___is_init_269 Bool) (temp___skip_constant_270 Bool)
  (temp___do_toplevel_271 Bool) (temp___do_typ_inv_272 Bool)) Bool true)

(define-fun dynamic_invariant3 ((temp___expr_329 Int)
  (temp___is_init_325 Bool) (temp___skip_constant_326 Bool)
  (temp___do_toplevel_327 Bool)
  (temp___do_typ_inv_328 Bool)) Bool (=>
                                     (or (= temp___is_init_325 true)
                                     (<= 0 1)) (in_range2 temp___expr_329)))

(define-fun dynamic_invariant4 ((temp___expr_360 Int)
  (temp___is_init_356 Bool) (temp___skip_constant_357 Bool)
  (temp___do_toplevel_358 Bool)
  (temp___do_typ_inv_359 Bool)) Bool (=>
                                     (or (= temp___is_init_356 true)
                                     (<= 1 199)) (in_range5 temp___expr_360)))

(define-fun dynamic_invariant5 ((temp___expr_336 Int)
  (temp___is_init_332 Bool) (temp___skip_constant_333 Bool)
  (temp___do_toplevel_334 Bool)
  (temp___do_typ_inv_335 Bool)) Bool (=>
                                     (or (= temp___is_init_332 true)
                                     (<= 0 199)) (in_range3 temp___expr_336)))

(define-fun dynamic_invariant6 ((temp___expr_353 Int)
  (temp___is_init_349 Bool) (temp___skip_constant_350 Bool)
  (temp___do_toplevel_351 Bool)
  (temp___do_typ_inv_352 Bool)) Bool (=>
                                     (or (= temp___is_init_349 true)
                                     (<= 0 1599)) (in_range4
                                     temp___expr_353)))

(assert
;; defqtvc
 ;; File "keccak-sponge.ads", line 136, characters 0-0
  (not
  (forall ((o Int))
  (=>
  (= (to_rep5
     (rec__ada___keccak__keccak_1600__sponge__context__rate
     (us_split_fields1 ctx))) o)
  (let ((o1 (* o 8))) (=> (in_range o1) (in_range1 o1)))))))
(check-sat)
(exit)
