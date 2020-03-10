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

(declare-fun nth ((_ BitVec 16) Int) Bool)

(declare-fun lsr ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun asr ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun lsl ((_ BitVec 16) Int) (_ BitVec 16))

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

(declare-fun rotate_right1 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun rotate_left1 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 16))) Int (ite (bvsge x (_ bv0 16))
                                            (bv2nat x)
                                            (- (- 65536 (bv2nat x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 65535)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvshl x n) (lsl x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvor (bvshl v (bvurem n (_ bv16 16))) (bvlshr v (bvsub (_ bv16 16) (bvurem n (_ bv16 16))))) 
  (rotate_left1 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvor (bvlshr v (bvurem n (_ bv16 16))) (bvshl v (bvsub (_ bv16 16) (bvurem n (_ bv16 16))))) 
  (rotate_right1 v (bv2nat n)))))

(declare-fun nth_bv ((_ BitVec 16) (_ BitVec 16)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 16)) (i (_ BitVec 16)))
  (= (= (nth_bv x i) true) (not (= (bvand (bvlshr x i) #x0001) #x0000)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 16)) (i (_ BitVec 16)))
  (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 16)) (i Int))
  (=> (and (<= 0 i) (< i 65536)) (= (nth_bv x ((_ int2bv 16) i)) (nth x i)))))

(declare-fun eq_sub_bv ((_ BitVec 16) (_ BitVec 16) (_ BitVec 16)
  (_ BitVec 16)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 16)) (b (_ BitVec 16)) (i (_ BitVec 16))
  (n (_ BitVec 16)))
  (let ((mask (bvshl (bvsub (bvshl #x0001 n) #x0001) i)))
  (= (eq_sub_bv a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub ((a (_ BitVec 16)) (b (_ BitVec 16)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 16)) (b (_ BitVec 16)) (i (_ BitVec 16))
  (n (_ BitVec 16)))
  (= (eq_sub a b (bv2nat i) (bv2nat n)) (eq_sub_bv a b i n))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content (_ BitVec 16))))))
(declare-fun power ((_ BitVec 16) Int) (_ BitVec 16))

(define-fun bv_min ((x (_ BitVec 16))
  (y (_ BitVec 16))) (_ BitVec 16) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 16))
  (y (_ BitVec 16))) (_ BitVec 16) (ite (bvule x y) y x))

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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

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

(declare-fun attr__ATTRIBUTE_IMAGE4 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) (_ BitVec 8))

(declare-fun user_eq3 (byte byte) Bool)

(declare-const dummy3 byte)

(declare-datatypes ((byte__ref 0))
(((byte__refqtmk (byte__content byte)))))
(define-fun byte__ref_byte__content__projection ((a byte__ref)) byte 
  (byte__content a))

(declare-fun to_rep1 (byte) (_ BitVec 8))

(declare-fun of_rep1 ((_ BitVec 8)) byte)

;; inversion_axiom
  (assert
  (forall ((x byte)) (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (= (to_rep1 (of_rep1 x)) x) :pattern ((to_rep1 (of_rep1 x))) )))

(define-fun to_int3 ((x byte)) Int (bv2nat (to_rep1 x)))

;; range_int_axiom
  (assert
  (forall ((x byte)) (! (uint_in_range1
  (to_int3 x)) :pattern ((to_int3 x)) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int byte))))))
(declare-fun slide ((Array Int byte) Int Int) (Array Int byte))

;; slide_eq
  (assert
  (forall ((a (Array Int byte)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int byte)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int byte)) (a__first Int) (a__last Int)
  (b (Array Int byte)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int byte)) (b (Array Int byte)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int byte))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int byte) (elts a))

(define-fun of_array ((a (Array Int byte)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ((bytes__ref 0))
(((bytes__refqtmk (bytes__content us_t)))))
(define-fun bytes__ref_bytes__content__projection ((a bytes__ref)) us_t 
  (bytes__content a))

(declare-const buffer us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun convert_to_two_octets (us_t) (_ BitVec 16))

(declare-fun convert_to_two_octets__function_guard ((_ BitVec 16) us_t) Bool)

(define-fun dynamic_invariant2 ((temp___expr_192 us_t)
  (temp___is_init_188 Bool) (temp___skip_constant_189 Bool)
  (temp___do_toplevel_190 Bool)
  (temp___do_typ_inv_191 Bool)) Bool (=>
                                     (not (= temp___skip_constant_189 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_192)
                                     (last1 temp___expr_192))))

(declare-sort uxx 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 16))

(declare-fun attr__ATTRIBUTE_IMAGE5 ((_ BitVec 16)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) (_ BitVec 16))

(declare-fun user_eq5 (uxx uxx) Bool)

(declare-const dummy5 uxx)

(declare-datatypes ((uxx__ref 0))
(((uxx__refqtmk (uxx__content uxx)))))
(define-fun uxx__ref_uxx__content__projection ((a uxx__ref)) uxx (uxx__content
                                                                 a))

(define-fun dynamic_invariant3 ((temp___expr_199 (_ BitVec 16))
  (temp___is_init_195 Bool) (temp___skip_constant_196 Bool)
  (temp___do_toplevel_197 Bool) (temp___do_typ_inv_198 Bool)) Bool true)

;; convert_to_two_octets__post_axiom
  (assert
  (forall ((buffer1 us_t))
  (! (=>
     (and (dynamic_invariant2 buffer1 true true true true)
     (= (length buffer1) 2))
     (let ((result (convert_to_two_octets buffer1)))
     (=> (convert_to_two_octets__function_guard result buffer1)
     (dynamic_invariant3 result true false true true)))) :pattern ((convert_to_two_octets
                                                                   buffer1)) )))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const r21b Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const r22b Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const r25b Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const r26b Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const r30b Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const r34b Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-const r35b Int)

(declare-const attr__ATTRIBUTE_ADDRESS12 Int)

(declare-const r38b Int)

(declare-const attr__ATTRIBUTE_ADDRESS13 Int)

(declare-sort tTethertype_length_1SP1 0)

(declare-fun tTethertype_length_1SP1qtint (tTethertype_length_1SP1) Int)

;; tTethertype_length_1SP1'axiom
  (assert
  (forall ((i tTethertype_length_1SP1))
  (and (<= 1 (tTethertype_length_1SP1qtint i))
  (<= (tTethertype_length_1SP1qtint i) 2))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (tTethertype_length_1SP1 tTethertype_length_1SP1) Bool)

(declare-const dummy6 tTethertype_length_1SP1)

(declare-datatypes ((tTethertype_length_1SP1__ref 0))
(((tTethertype_length_1SP1__refqtmk
  (tTethertype_length_1SP1__content tTethertype_length_1SP1)))))
(define-fun tTethertype_length_1SP1__ref_tTethertype_length_1SP1__content__projection ((a tTethertype_length_1SP1__ref)) tTethertype_length_1SP1 
  (tTethertype_length_1SP1__content a))

(declare-sort tTethertype_length_2SP1 0)

(declare-fun tTethertype_length_2SP1qtint (tTethertype_length_2SP1) Int)

;; tTethertype_length_2SP1'axiom
  (assert
  (forall ((i tTethertype_length_2SP1))
  (and (<= 1 (tTethertype_length_2SP1qtint i))
  (<= (tTethertype_length_2SP1qtint i) 2))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq7 (tTethertype_length_2SP1 tTethertype_length_2SP1) Bool)

(declare-const dummy7 tTethertype_length_2SP1)

(declare-datatypes ((tTethertype_length_2SP1__ref 0))
(((tTethertype_length_2SP1__refqtmk
  (tTethertype_length_2SP1__content tTethertype_length_2SP1)))))
(define-fun tTethertype_length_2SP1__ref_tTethertype_length_2SP1__content__projection ((a tTethertype_length_2SP1__ref)) tTethertype_length_2SP1 
  (tTethertype_length_2SP1__content a))

(declare-sort tTethertype_length_3SP1 0)

(declare-fun tTethertype_length_3SP1qtint (tTethertype_length_3SP1) Int)

;; tTethertype_length_3SP1'axiom
  (assert
  (forall ((i tTethertype_length_3SP1))
  (and (<= 1 (tTethertype_length_3SP1qtint i))
  (<= (tTethertype_length_3SP1qtint i) 2))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq8 (tTethertype_length_3SP1 tTethertype_length_3SP1) Bool)

(declare-const dummy8 tTethertype_length_3SP1)

(declare-datatypes ((tTethertype_length_3SP1__ref 0))
(((tTethertype_length_3SP1__refqtmk
  (tTethertype_length_3SP1__content tTethertype_length_3SP1)))))
(define-fun tTethertype_length_3SP1__ref_tTethertype_length_3SP1__content__projection ((a tTethertype_length_3SP1__ref)) tTethertype_length_3SP1 
  (tTethertype_length_3SP1__content a))

(declare-sort tTlengthSP1 0)

(declare-fun tTlengthSP1qtint (tTlengthSP1) Int)

;; tTlengthSP1'axiom
  (assert
  (forall ((i tTlengthSP1))
  (and (<= 1 (tTlengthSP1qtint i)) (<= (tTlengthSP1qtint i) 2))))

(define-fun in_range7 ((x Int)) Bool (and (<= 1 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE9 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check9 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE9 (us_image) Int)

(declare-fun user_eq9 (tTlengthSP1 tTlengthSP1) Bool)

(declare-const dummy9 tTlengthSP1)

(declare-datatypes ((tTlengthSP1__ref 0))
(((tTlengthSP1__refqtmk (tTlengthSP1__content tTlengthSP1)))))
(define-fun tTlengthSP1__ref_tTlengthSP1__content__projection ((a tTlengthSP1__ref)) tTlengthSP1 
  (tTlengthSP1__content a))

(declare-datatypes ((t7b__ref 0))
(((t7b__refqtmk (t7b__content us_t)))))
(define-fun t7b__ref_t7b__content__projection ((a t7b__ref)) us_t (t7b__content
                                                                  a))

(declare-datatypes ((t9b__ref 0))
(((t9b__refqtmk (t9b__content us_t)))))
(define-fun t9b__ref_t9b__content__projection ((a t9b__ref)) us_t (t9b__content
                                                                  a))

(declare-datatypes ((t11b__ref 0))
(((t11b__refqtmk (t11b__content us_t)))))
(define-fun t11b__ref_t11b__content__projection ((a t11b__ref)) us_t 
  (t11b__content a))

(declare-datatypes ((t13b__ref 0))
(((t13b__refqtmk (t13b__content us_t)))))
(define-fun t13b__ref_t13b__content__projection ((a t13b__ref)) us_t 
  (t13b__content a))

(declare-datatypes ((t15b__ref 0))
(((t15b__refqtmk (t15b__content us_t)))))
(define-fun t15b__ref_t15b__content__projection ((a t15b__ref)) us_t 
  (t15b__content a))

(declare-datatypes ((t17b__ref 0))
(((t17b__refqtmk (t17b__content us_t)))))
(define-fun t17b__ref_t17b__content__projection ((a t17b__ref)) us_t 
  (t17b__content a))

(declare-datatypes ((t19b__ref 0))
(((t19b__refqtmk (t19b__content us_t)))))
(define-fun t19b__ref_t19b__content__projection ((a t19b__ref)) us_t 
  (t19b__content a))

(declare-datatypes ((t24b__ref 0))
(((t24b__refqtmk (t24b__content us_t)))))
(define-fun t24b__ref_t24b__content__projection ((a t24b__ref)) us_t 
  (t24b__content a))

(declare-datatypes ((t28b__ref 0))
(((t28b__refqtmk (t28b__content us_t)))))
(define-fun t28b__ref_t28b__content__projection ((a t28b__ref)) us_t 
  (t28b__content a))

(declare-datatypes ((t32b__ref 0))
(((t32b__refqtmk (t32b__content us_t)))))
(define-fun t32b__ref_t32b__content__projection ((a t32b__ref)) us_t 
  (t32b__content a))

(declare-datatypes ((t37b__ref 0))
(((t37b__refqtmk (t37b__content us_t)))))
(define-fun t37b__ref_t37b__content__projection ((a t37b__ref)) us_t 
  (t37b__content a))

(declare-datatypes ((t40b__ref 0))
(((t40b__refqtmk (t40b__content us_t)))))
(define-fun t40b__ref_t40b__content__projection ((a t40b__ref)) us_t 
  (t40b__content a))

(define-fun dynamic_invariant4 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun dynamic_invariant5 ((temp___expr_185 (_ BitVec 8))
  (temp___is_init_181 Bool) (temp___skip_constant_182 Bool)
  (temp___do_toplevel_183 Bool) (temp___do_typ_inv_184 Bool)) Bool true)

(assert
;; defqtvc
 ;; File "ethernet_dissector.ads", line 12, characters 0-0
  (not
  (forall ((offset Int) (spark__branch Bool))
  (=> (dynamic_invariant2 buffer true false true true)
  (=> (= offset 0)
  (=> (dynamic_invariant offset true false true true)
  (=>
  (= spark__branch (or (or (ite (= (first1 buffer) 1) false true) (ite (< 
                                                                  (length
                                                                  buffer) 60)
                                                                  true false)) 
  (ite (< 1520 (length buffer)) true false)))
  (=> (not (= spark__branch true))
  (=> (< 5 (length buffer))
  (let ((o (+ (first1 buffer) 5)))
  (=> (in_range1 o)
  (let ((temp___297 (first1 buffer)))
  (=>
  (=> (<= temp___297 o)
  (and (and (<= (first1 buffer) temp___297) (<= temp___297 (last1 buffer)))
  (and (<= (first1 buffer) o) (<= o (last1 buffer)))))
  (let ((o1 (+ (first1 buffer) 11)))
  (=> (in_range1 o1)
  (let ((o2 (+ (first1 buffer) 6)))
  (=> (in_range1 o2)
  (=>
  (=> (<= o2 o1)
  (and (and (<= (first1 buffer) o2) (<= o2 (last1 buffer)))
  (and (<= (first1 buffer) o1) (<= o1 (last1 buffer)))))
  (let ((o3 (+ (first1 buffer) 13)))
  (=> (in_range1 o3)
  (let ((o4 (+ (first1 buffer) 12)))
  (=> (in_range1 o4)
  (=>
  (=> (<= o4 o3)
  (and (and (<= (first1 buffer) o4) (<= o4 (last1 buffer)))
  (and (<= (first1 buffer) o3) (<= o3 (last1 buffer)))))
  (let ((temp___305 (of_array (to_array buffer) o4 o3)))
  (=>
  (ite (<= (first1 temp___305) (last1 temp___305))
  (and (<= 1 2) (= (- (last1 temp___305) (first1 temp___305)) (- 2 1)))
  (< 2 1))
  (forall ((ethertype_length_1 (Array Int byte)))
  (=>
  (= ethertype_length_1 (slide (to_array temp___305) (first1 temp___305) 1))
  (forall ((spark__branch1 Bool) (offset1 Int))
  (=>
  (let ((o5 (of_array ethertype_length_1 1 2)))
  (let ((o6 (convert_to_two_octets o5)))
  (and
  (and (convert_to_two_octets__function_guard o6 o5) (dynamic_invariant3 o6
  true false true true))
  (exists ((spark__branch2 Bool))
  (and (= spark__branch2 (ite (= o6 #x8100) true false))
  (ite (= spark__branch2 true)
  (and
  (let ((o7 (+ (first1 buffer) 15)))
  (and (in_range1 o7)
  (let ((o8 (+ (first1 buffer) 12)))
  (and (in_range1 o8)
  (and
  (=> (<= o8 o7)
  (and (and (<= (first1 buffer) o8) (<= o8 (last1 buffer)))
  (and (<= (first1 buffer) o7) (<= o7 (last1 buffer)))))
  (let ((o9 (+ offset 4))) (and (in_range1 o9) (= offset1 o9))))))))
  (= spark__branch1 spark__branch2))
  (let ((o7 (of_array ethertype_length_1 1 2)))
  (let ((o8 (convert_to_two_octets o7)))
  (and
  (and (convert_to_two_octets__function_guard o8 o7) (dynamic_invariant3 o8
  true false true true))
  (exists ((spark__branch3 Bool))
  (and (= spark__branch3 (ite (= o8 #x88A8) true false))
  (ite (= spark__branch3 true)
  (let ((o9 (+ (first1 buffer) 15)))
  (and (in_range1 o9)
  (let ((o10 (+ (first1 buffer) 12)))
  (and (in_range1 o10)
  (and
  (=> (<= o10 o9)
  (and (and (<= (first1 buffer) o10) (<= o10 (last1 buffer)))
  (and (<= (first1 buffer) o9) (<= o9 (last1 buffer)))))
  (let ((o11 (+ offset 4)))
  (and (in_range1 o11)
  (exists ((offset2 Int))
  (and (= offset2 o11)
  (let ((o12 (+ (first1 buffer) 17)))
  (and (in_range1 o12)
  (let ((o13 (+ (first1 buffer) 16)))
  (and (in_range1 o13)
  (and
  (=> (<= o13 o12)
  (and (and (<= (first1 buffer) o13) (<= o13 (last1 buffer)))
  (and (<= (first1 buffer) o12) (<= o12 (last1 buffer)))))
  (let ((temp___314 (of_array (to_array buffer) o13 o12)))
  (and
  (ite (<= (first1 temp___314) (last1 temp___314))
  (and (<= 1 2) (= (- (last1 temp___314) (first1 temp___314)) (- 2 1)))
  (< 2 1))
  (exists ((ethertype_length_2 (Array Int byte)))
  (and
  (= ethertype_length_2 (slide (to_array temp___314) (first1 temp___314) 1))
  (let ((o14 (of_array ethertype_length_2 1 2)))
  (let ((o15 (convert_to_two_octets o14)))
  (and
  (and (convert_to_two_octets__function_guard o15 o14) (dynamic_invariant3
  o15 true false true true))
  (and (= spark__branch1 (ite (= o15 #x8100) true false))
  (and (= spark__branch1 true)
  (let ((o16 (+ (first1 buffer) 19)))
  (and (in_range1 o16)
  (let ((o17 (+ (first1 buffer) 16)))
  (and (in_range1 o17)
  (and
  (=> (<= o17 o16)
  (and (and (<= (first1 buffer) o17) (<= o17 (last1 buffer)))
  (and (<= (first1 buffer) o16) (<= o16 (last1 buffer)))))
  (let ((o18 (+ offset2 4))) (and (in_range1 o18) (= offset1 o18)))))))))))))))))))))))))))))))
  (and (= spark__branch1 spark__branch3) (= offset1 offset))))))))))))))
  (let ((o5 (+ (first1 buffer) 12)))
  (=> (in_range1 o5)
  (let ((o6 (+ o5 offset1)))
  (=> (in_range1 o6)
  (=> (= o6 r21b)
  (=> (dynamic_invariant1 r21b true false true true)
  (let ((o7 (+ (first1 buffer) 13)))
  (=> (in_range1 o7)
  (let ((o8 (+ o7 offset1)))
  (=> (in_range1 o8)
  (=> (= o8 r22b)
  (=> (dynamic_invariant1 r22b true false true true)
  (=>
  (=> (<= r21b r22b)
  (and (and (<= (first1 buffer) r21b) (<= r21b (last1 buffer)))
  (and (<= (first1 buffer) r22b) (<= r22b (last1 buffer)))))
  (let ((temp___318 (of_array (to_array buffer) r21b r22b)))
  (=>
  (ite (<= (first1 temp___318) (last1 temp___318))
  (and (<= 1 2) (= (- (last1 temp___318) (first1 temp___318)) (- 2 1)))
  (< 2 1))
  (forall ((ethertype_length_3 (Array Int byte)))
  (=>
  (= ethertype_length_3 (slide (to_array temp___318) (first1 temp___318) 1))
  (let ((o9 (of_array ethertype_length_3 1 2)))
  (let ((o10 (convert_to_two_octets o9)))
  (=>
  (and (convert_to_two_octets__function_guard o10 o9) (dynamic_invariant3 o10
  true false true true))
  (let ((o11 (of_array ethertype_length_3 1 2)))
  (let ((o12 (convert_to_two_octets o11)))
  (=>
  (and (convert_to_two_octets__function_guard o12 o11) (dynamic_invariant3
  o12 true false true true))
  (forall ((spark__branch2 Bool))
  (=>
  (= spark__branch2 (and (ite (bvule #x0000 o12) true false) (ite (bvule o10 #x05DC)
                                                             true false)))
  (=> (= spark__branch2 true)
  (let ((o13 (+ (first1 buffer) 12)))
  (=> (in_range1 o13)
  (let ((o14 (+ o13 offset1)))
  (=> (in_range1 o14)
  (=> (= o14 r25b)
  (=> (dynamic_invariant1 r25b true false true true) (in_range1
  (+ (first1 buffer) 13)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
