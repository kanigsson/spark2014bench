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

(declare-fun nth ((_ BitVec 64) Int) Bool)

(declare-fun lsr ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun asr ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun lsl ((_ BitVec 64) Int) (_ BitVec 64))

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

(declare-fun rotate_right1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun rotate_left1 ((_ BitVec 64) Int) (_ BitVec 64))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 64))) Int (ite (bvsge x (_ bv0 64))
                                            (bv2nat x)
                                            (- (- 18446744073709551616 (bv2nat x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i)
                                         (<= i 18446744073709551615)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvshl x n) (lsl x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvor (bvshl v (bvurem n (_ bv64 64))) (bvlshr v (bvsub (_ bv64 64) (bvurem n (_ bv64 64))))) 
  (rotate_left1 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 64)) (n (_ BitVec 64)))
  (= (bvor (bvlshr v (bvurem n (_ bv64 64))) (bvshl v (bvsub (_ bv64 64) (bvurem n (_ bv64 64))))) 
  (rotate_right1 v (bv2nat n)))))

(declare-fun nth_bv ((_ BitVec 64) (_ BitVec 64)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 64)) (i (_ BitVec 64)))
  (= (= (nth_bv x i) true)
  (not (= (bvand (bvlshr x i) #x0000000000000001) #x0000000000000000)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 64)) (i (_ BitVec 64)))
  (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 64)) (i Int))
  (=> (and (<= 0 i) (< i 18446744073709551616))
  (= (nth_bv x ((_ int2bv 64) i)) (nth x i)))))

(declare-fun eq_sub_bv ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)
  (_ BitVec 64)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 64)) (b (_ BitVec 64)) (i (_ BitVec 64))
  (n (_ BitVec 64)))
  (let ((mask (bvshl (bvsub (bvshl #x0000000000000001 n) #x0000000000000001) i)))
  (= (eq_sub_bv a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub ((a (_ BitVec 64)) (b (_ BitVec 64)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 64)) (b (_ BitVec 64)) (i (_ BitVec 64))
  (n (_ BitVec 64)))
  (= (eq_sub a b (bv2nat i) (bv2nat n)) (eq_sub_bv a b i n))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content (_ BitVec 64))))))
(declare-fun power ((_ BitVec 64) Int) (_ BitVec 64))

(define-fun bv_min ((x (_ BitVec 64))
  (y (_ BitVec 64))) (_ BitVec 64) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 64))
  (y (_ BitVec 64))) (_ BitVec 64) (ite (bvule x y) y x))

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

(declare-fun nth1 ((_ BitVec 8) Int) Bool)

(declare-fun lsr1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun asr1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun lsl1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_right2 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_left2 ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun to_int2 ((x (_ BitVec 8))) Int (ite (bvsge x (_ bv0 8))
                                           (bv2nat x) (- (- 256 (bv2nat x)))))

(define-fun uint_in_range1 ((i Int)) Bool (and (<= 0 i) (<= i 255)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvlshr x n) (lsr1 x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvashr x n) (asr1 x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvshl x n) (lsl1 x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvor (bvshl v (bvurem n (_ bv8 8))) (bvlshr v (bvsub (_ bv8 8) (bvurem n (_ bv8 8))))) 
  (rotate_left2 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 8)) (n (_ BitVec 8)))
  (= (bvor (bvlshr v (bvurem n (_ bv8 8))) (bvshl v (bvsub (_ bv8 8) (bvurem n (_ bv8 8))))) 
  (rotate_right2 v (bv2nat n)))))

(declare-fun nth_bv1 ((_ BitVec 8) (_ BitVec 8)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 8)) (i (_ BitVec 8)))
  (= (= (nth_bv1 x i) true) (not (= (bvand (bvlshr x i) #x01) #x00)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 8)) (i (_ BitVec 8)))
  (= (nth1 x (bv2nat i)) (nth_bv1 x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 8)) (i Int))
  (=> (and (<= 0 i) (< i 256)) (= (nth_bv1 x ((_ int2bv 8) i)) (nth1 x i)))))

(declare-fun eq_sub_bv1 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 8)) (b (_ BitVec 8)) (i (_ BitVec 8))
  (n (_ BitVec 8)))
  (let ((mask (bvshl (bvsub (bvshl #x01 n) #x01) i)))
  (= (eq_sub_bv1 a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub1 ((a (_ BitVec 8)) (b (_ BitVec 8)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth1 a j) (nth1 b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 8)) (b (_ BitVec 8)) (i (_ BitVec 8))
  (n (_ BitVec 8)))
  (= (eq_sub1 a b (bv2nat i) (bv2nat n)) (eq_sub_bv1 a b i n))))

(declare-datatypes ((t__ref1 0))
(((t__refqtmk1 (t__content1 (_ BitVec 8))))))
(declare-fun power1 ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun bv_min1 ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) x y))

(define-fun bv_max1 ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) y x))

(declare-sort byte 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 8))

(declare-fun user_eq (byte byte) Bool)

(declare-const dummy byte)

(declare-datatypes ((byte__ref 0))
(((byte__refqtmk (byte__content byte)))))
(define-fun byte__ref_byte__content__projection ((a byte__ref)) byte 
  (byte__content a))

(declare-fun to_rep (byte) (_ BitVec 8))

(declare-fun of_rep ((_ BitVec 8)) byte)

;; inversion_axiom
  (assert
  (forall ((x byte)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (= (to_rep (of_rep x)) x) :pattern ((to_rep (of_rep x))) )))

(define-fun to_int3 ((x byte)) Int (bv2nat (to_rep x)))

;; range_int_axiom
  (assert
  (forall ((x byte)) (! (uint_in_range1
  (to_int3 x)) :pattern ((to_int3 x)) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array (_ BitVec 64) byte))))))
(declare-fun slide ((Array (_ BitVec 64) byte) (_ BitVec 64)
  (_ BitVec 64)) (Array (_ BitVec 64) byte))

;; slide_eq
  (assert
  (forall ((a (Array (_ BitVec 64) byte)))
  (forall ((first (_ BitVec 64)))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array (_ BitVec 64) byte)))
  (forall ((old_first (_ BitVec 64)))
  (forall ((new_first (_ BitVec 64)))
  (forall ((i (_ BitVec 64)))
  (! (= (select (slide a old_first new_first) i) (select a (bvsub i (bvsub new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array (_ BitVec 64) byte)) (a__first (_ BitVec 64))
  (a__last (_ BitVec 64)) (b (Array (_ BitVec 64) byte))
  (b__first (_ BitVec 64))
  (b__last (_ BitVec 64))) Bool (ite (and
                                     (ite (bvule a__first a__last)
                                     (and (bvule b__first b__last)
                                     (= (bvsub a__last a__first) (bvsub b__last b__first)))
                                     (bvugt b__first b__last))
                                     (forall ((temp___idx_154 (_ BitVec 64)))
                                     (=>
                                     (and (bvule a__first temp___idx_154)
                                     (bvule temp___idx_154 a__last))
                                     (= (to_rep (select a temp___idx_154)) 
                                     (to_rep
                                     (select b (bvadd (bvsub b__first a__first) temp___idx_154)))))))
                                true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array (_ BitVec 64) byte)) (b (Array (_ BitVec 64) byte)))
  (forall ((a__first (_ BitVec 64)) (a__last (_ BitVec 64))
  (b__first (_ BitVec 64)) (b__last (_ BitVec 64)))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (bvule a__first a__last)
  (and (bvule b__first b__last)
  (= (bvsub a__last a__first) (bvsub b__last b__first)))
  (bvugt b__first b__last))
  (forall ((temp___idx_154 (_ BitVec 64)))
  (=> (and (bvule a__first temp___idx_154) (bvule temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (bvadd (bvsub b__first a__first) temp___idx_154)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const dest (_ BitVec 64))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const src (_ BitVec 64))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort address 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 64))

(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 64)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 64))

(declare-fun user_eq1 (address address) Bool)

(declare-const dummy1 address)

(declare-datatypes ((address__ref 0))
(((address__refqtmk (address__content address)))))
(define-fun address__ref_address__content__projection ((a address__ref)) address 
  (address__content a))

(define-fun dynamic_invariant ((temp___expr_187 (_ BitVec 64))
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool) (temp___do_typ_inv_186 Bool)) Bool true)

(declare-fun to_rep1 (address) (_ BitVec 64))

(declare-fun of_rep1 ((_ BitVec 64)) address)

;; inversion_axiom
  (assert
  (forall ((x address))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 64)))
  (! (= (to_rep1 (of_rep1 x)) x) :pattern ((to_rep1 (of_rep1 x))) )))

(define-fun to_int4 ((x address)) Int (bv2nat (to_rep1 x)))

;; range_int_axiom
  (assert
  (forall ((x address)) (! (uint_in_range
  (to_int4 x)) :pattern ((to_int4 x)) )))

(declare-sort t 0)

(declare-fun first (t) address)

(declare-fun last (t) address)

(declare-fun mk ((_ BitVec 64) (_ BitVec 64)) t)

;; mk_def
  (assert
  (forall ((f (_ BitVec 64)) (l (_ BitVec 64)))
  (! (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first (_ BitVec 64))
  (range_last (_ BitVec 64)) (low (_ BitVec 64))
  (high (_ BitVec 64))) Bool true)

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array (_ BitVec 64) byte))(rt t)))))
(define-fun to_array ((a us_t)) (Array (_ BitVec 64) byte) (elts a))

(define-fun of_array ((a (Array (_ BitVec 64) byte)) (f (_ BitVec 64))
  (l (_ BitVec 64))) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) (_ BitVec 64) (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) (_ BitVec 64) (to_rep1 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (bvule (first1 a) (last1 a))
                                  (+ (- (bv2nat (last1 a)) (bv2nat (first1 a))) 1)
                                  0))

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

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq2 (us_t us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes ((tmemoryB__ref 0))
(((tmemoryB__refqtmk (tmemoryB__content us_t)))))
(define-fun tmemoryB__ref_tmemoryB__content__projection ((a tmemoryB__ref)) us_t 
  (tmemoryB__content a))

(declare-datatypes ((t5b__ref 0))
(((t5b__refqtmk (t5b__content us_t)))))
(define-fun t5b__ref_t5b__content__projection ((a t5b__ref)) us_t (t5b__content
                                                                  a))

(declare-datatypes ((t7b__ref 0))
(((t7b__refqtmk (t7b__content us_t)))))
(define-fun t7b__ref_t7b__content__projection ((a t7b__ref)) us_t (t7b__content
                                                                  a))

(define-fun dynamic_invariant1 ((temp___expr_180 (_ BitVec 8))
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool) (temp___do_typ_inv_179 Bool)) Bool true)

(assert
;; defqtvc
 ;; File "memassign2.adb", line 11, characters 0-0
  (not
  (forall ((mem (Array (_ BitVec 64) byte)))
  (=> (dynamic_invariant dest true false true true)
  (=> (dynamic_invariant src true false true true)
  (=> (bvugt (bvsub #xFFFFFFFFFFFFFFFF dest) #x0000000000000000)
  (=> (bvugt (bvsub #xFFFFFFFFFFFFFFFF src) #x0000000000000000)
  (=> (bvule dest (bvadd dest #x0000000000000001))
  (=> (bvule src (bvadd src #x0000000000000001))
  (let ((temp___202 (bvadd src #x0000000000000001)))
  (=>
  (=> (bvule src temp___202)
  (and (and (bvule #x0000000000000000 src) (bvule src #xFFFFFFFFFFFFFFFF))
  (and (bvule #x0000000000000000 temp___202)
  (bvule temp___202 #xFFFFFFFFFFFFFFFF))))
  (let ((temp___203 (of_array mem src temp___202)))
  (=> (bvule (first1 temp___203) (last1 temp___203))
  (bvule dest (bvadd dest #x0000000000000001)))))))))))))))
(check-sat)
(exit)
