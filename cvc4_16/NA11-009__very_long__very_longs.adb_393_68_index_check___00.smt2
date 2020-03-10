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

(declare-sort digit_index_type 0)

(declare-fun digit_index_typeqtint (digit_index_type) Int)

;; digit_index_type'axiom
  (assert
  (forall ((i digit_index_type))
  (and (<= 1 (digit_index_typeqtint i)) (<= (digit_index_typeqtint i) 65536))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 65536)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (digit_index_type digit_index_type) Bool)

(declare-const dummy digit_index_type)

(declare-datatypes ((digit_index_type__ref 0))
(((digit_index_type__refqtmk (digit_index_type__content digit_index_type)))))
(define-fun digit_index_type__ref_digit_index_type__content__projection ((a digit_index_type__ref)) digit_index_type 
  (digit_index_type__content a))

(define-fun to_rep ((x digit_index_type)) Int (digit_index_typeqtint x))

(declare-fun of_rep (Int) digit_index_type)

;; inversion_axiom
  (assert
  (forall ((x digit_index_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x digit_index_type)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort tdigit_count_typeB 0)

(declare-fun tdigit_count_typeBqtint (tdigit_count_typeB) Int)

;; tdigit_count_typeB'axiom
  (assert
  (forall ((i tdigit_count_typeB))
  (and (<= (- 2147483648) (tdigit_count_typeBqtint i))
  (<= (tdigit_count_typeBqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (tdigit_count_typeB tdigit_count_typeB) Bool)

(declare-const dummy1 tdigit_count_typeB)

(declare-datatypes ((tdigit_count_typeB__ref 0))
(((tdigit_count_typeB__refqtmk
  (tdigit_count_typeB__content tdigit_count_typeB)))))
(define-fun tdigit_count_typeB__ref_tdigit_count_typeB__content__projection ((a tdigit_count_typeB__ref)) tdigit_count_typeB 
  (tdigit_count_typeB__content a))

(define-fun to_rep1 ((x tdigit_count_typeB)) Int (tdigit_count_typeBqtint x))

(declare-fun of_rep1 (Int) tdigit_count_typeB)

;; inversion_axiom
  (assert
  (forall ((x tdigit_count_typeB))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x tdigit_count_typeB)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort octet 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE3 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) (_ BitVec 8))

(declare-fun user_eq2 (octet octet) Bool)

(declare-const dummy2 octet)

(declare-datatypes ((octet__ref 0))
(((octet__refqtmk (octet__content octet)))))
(define-fun octet__ref_octet__content__projection ((a octet__ref)) octet 
  (octet__content a))

(declare-fun to_rep2 (octet) (_ BitVec 8))

(declare-fun of_rep2 ((_ BitVec 8)) octet)

;; inversion_axiom
  (assert
  (forall ((x octet))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (= (to_rep2 (of_rep2 x)) x) :pattern ((to_rep2 (of_rep2 x))) )))

(define-fun to_int2 ((x octet)) Int (bv2nat (to_rep2 x)))

;; range_int_axiom
  (assert
  (forall ((x octet)) (! (uint_in_range
  (to_int2 x)) :pattern ((to_int2 x)) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int octet))))))
(declare-fun slide ((Array Int octet) Int Int) (Array Int octet))

;; slide_eq
  (assert
  (forall ((a (Array Int octet)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int octet)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int octet)) (a__first Int) (a__last Int)
  (b (Array Int octet)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep2 (select a temp___idx_154)) (to_rep2
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int octet)) (b (Array Int octet)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep2 (select a temp___idx_154)) (to_rep2
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t 0)

(declare-fun first (t) tdigit_count_typeB)

(declare-fun last (t) tdigit_count_typeB)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int octet))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int octet) (elts a))

(define-fun of_array ((a (Array Int octet)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((digits_array_type__ref 0))
(((digits_array_type__refqtmk (digits_array_type__content us_t)))))
(define-fun digits_array_type__ref_digits_array_type__content__projection ((a digits_array_type__ref)) us_t 
  (digits_array_type__content a))

(declare-datatypes ((t18s__ref 0))
(((t18s__refqtmk (t18s__content us_t)))))
(define-fun t18s__ref_t18s__content__projection ((a t18s__ref)) us_t 
  (t18s__content a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__very_longs__very_long__length digit_index_type)))))
(define-fun us_split_discrs_rec__very_longs__very_long__length__projection ((a us_split_discrs)) digit_index_type 
  (rec__very_longs__very_long__length a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__very_longs__very_long__long_digits us_t)))))
(define-fun us_split_fields_rec__very_longs__very_long__long_digits__projection ((a us_split_fields)) us_t 
  (rec__very_longs__very_long__long_digits a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__very_longs__very_long__length
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__very_longs__very_long__length
                                                  (us_split_discrs1 b))))
                        (= (bool_eq1
                           (rec__very_longs__very_long__long_digits
                           (us_split_fields1 a))
                           (rec__very_longs__very_long__long_digits
                           (us_split_fields1 b))) true))
                   true false))

(define-fun in_range3 ((rec__very_longs__very_long__length1 Int)
  (a us_split_discrs)) Bool (= rec__very_longs__very_long__length1 (to_rep
                                                                   (rec__very_longs__very_long__length
                                                                   a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const very_longs__very_long__length__first__bit Int)

(declare-const very_longs__very_long__length__last__bit Int)

(declare-const very_longs__very_long__length__position Int)

;; very_longs__very_long__length__first__bit_axiom
  (assert (<= 0 very_longs__very_long__length__first__bit))

;; very_longs__very_long__length__last__bit_axiom
  (assert
  (< very_longs__very_long__length__first__bit very_longs__very_long__length__last__bit))

;; very_longs__very_long__length__position_axiom
  (assert (<= 0 very_longs__very_long__length__position))

(declare-const very_longs__very_long__long_digits__first__bit Int)

(declare-const very_longs__very_long__long_digits__last__bit Int)

(declare-const very_longs__very_long__long_digits__position Int)

;; very_longs__very_long__long_digits__first__bit_axiom
  (assert (<= 0 very_longs__very_long__long_digits__first__bit))

;; very_longs__very_long__long_digits__last__bit_axiom
  (assert
  (< very_longs__very_long__long_digits__first__bit very_longs__very_long__long_digits__last__bit))

;; very_longs__very_long__long_digits__position_axiom
  (assert (<= 0 very_longs__very_long__long_digits__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((very_long__ref 0))
(((very_long__refqtmk (very_long__content us_rep)))))
(define-fun very_long__ref_very_long__content__projection ((a very_long__ref)) us_rep 
  (very_long__content a))

(define-fun dynamic_invariant ((temp___expr_263 us_rep)
  (temp___is_init_259 Bool) (temp___skip_constant_260 Bool)
  (temp___do_toplevel_261 Bool)
  (temp___do_typ_inv_262 Bool)) Bool (let ((temp___264 (rec__very_longs__very_long__length
                                                       (us_split_discrs1
                                                       temp___expr_263))))
                                     (and (dynamic_property 1
                                     (to_rep temp___264)
                                     (first1
                                     (rec__very_longs__very_long__long_digits
                                     (us_split_fields1 temp___expr_263)))
                                     (last1
                                     (rec__very_longs__very_long__long_digits
                                     (us_split_fields1 temp___expr_263))))
                                     (and
                                     (= (first1
                                        (rec__very_longs__very_long__long_digits
                                        (us_split_fields1 temp___expr_263))) 1)
                                     (= (last1
                                        (rec__very_longs__very_long__long_digits
                                        (us_split_fields1 temp___expr_263))) 
                                     (to_rep temp___264))))))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (natural natural) Bool)

(declare-const dummy5 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range4
                                    temp___expr_39)))

(declare-fun shift_right ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun shift_right__function_guard ((_ BitVec 8) (_ BitVec 8)
  Int) Bool)

(define-fun dynamic_invariant2 ((temp___expr_250 (_ BitVec 8))
  (temp___is_init_246 Bool) (temp___skip_constant_247 Bool)
  (temp___do_toplevel_248 Bool) (temp___do_typ_inv_249 Bool)) Bool true)

;; shift_right__post_axiom
  (assert
  (forall ((value (_ BitVec 8)))
  (forall ((count Int))
  (! (=>
     (and (dynamic_invariant2 value true true true true) (dynamic_invariant1
     count true true true true))
     (let ((result (shift_right value count)))
     (=> (shift_right__function_guard result value count)
     (and
     (= result (bvudiv value (ite (< count 256)
                             (bvshl #x01 ((_ int2bv 8) count)) #x00)))
     (dynamic_invariant2 result true false true true))))) :pattern ((shift_right
                                                                    value
                                                                    count)) ))))

(declare-const number us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const result____split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const distance Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const r116b Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(define-fun dynamic_invariant3 ((temp___expr_243 Int)
  (temp___is_init_239 Bool) (temp___skip_constant_240 Bool)
  (temp___do_toplevel_241 Bool)
  (temp___do_typ_inv_242 Bool)) Bool (=>
                                     (or (= temp___is_init_239 true)
                                     (<= 1 65536)) (in_range1
                                     temp___expr_243)))

(declare-sort shift_type 0)

(declare-fun shift_typeqtint (shift_type) Int)

;; shift_type'axiom
  (assert
  (forall ((i shift_type))
  (and (<= 0 (shift_typeqtint i)) (<= (shift_typeqtint i) 7))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 7)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq6 (shift_type shift_type) Bool)

(declare-const dummy6 shift_type)

(declare-datatypes ((shift_type__ref 0))
(((shift_type__refqtmk (shift_type__content shift_type)))))
(define-fun shift_type__ref_shift_type__content__projection ((a shift_type__ref)) shift_type 
  (shift_type__content a))

(define-fun dynamic_invariant4 ((temp___expr_781 Int)
  (temp___is_init_777 Bool) (temp___skip_constant_778 Bool)
  (temp___do_toplevel_779 Bool)
  (temp___do_typ_inv_780 Bool)) Bool (=>
                                     (or (= temp___is_init_777 true)
                                     (<= 0 7)) (in_range5 temp___expr_781)))

(declare-datatypes ((s115b__ref 0))
(((s115b__refqtmk (s115b__content us_t)))))
(define-fun s115b__ref_s115b__content__projection ((a s115b__ref)) us_t 
  (s115b__content a))

(declare-datatypes ((t118b__ref 0))
(((t118b__refqtmk (t118b__content us_t)))))
(define-fun t118b__ref_t118b__content__projection ((a t118b__ref)) us_t 
  (t118b__content a))

(declare-fun temp_____aggregate_def_1281 ((_ BitVec 8) Int Int) us_t)

;; def_axiom
  (assert
  (forall ((temp___1283 (_ BitVec 8)))
  (forall ((temp___1284 Int) (temp___1285 Int))
  (let ((temp___1282 (temp_____aggregate_def_1281 temp___1283 temp___1284
                     temp___1285)))
  (=> (dynamic_invariant2 temp___1283 true true true true)
  (and
  (=> (dynamic_property 1 65536 temp___1284 temp___1285)
  (and (= (first1 temp___1282) temp___1284)
  (= (last1 temp___1282) temp___1285)))
  (forall ((temp___1286 Int))
  (= (to_rep2 (select (to_array temp___1282) temp___1286)) temp___1283))))))))

(define-fun dynamic_invariant5 ((temp___expr_257 us_t)
  (temp___is_init_253 Bool) (temp___skip_constant_254 Bool)
  (temp___do_toplevel_255 Bool)
  (temp___do_typ_inv_256 Bool)) Bool (=>
                                     (not (= temp___skip_constant_254 true))
                                     (dynamic_property 1 65536
                                     (first1 temp___expr_257)
                                     (last1 temp___expr_257))))

(define-fun dynamic_invariant6 ((temp___expr_827 us_t)
  (temp___is_init_823 Bool) (temp___skip_constant_824 Bool)
  (temp___do_toplevel_825 Bool)
  (temp___do_typ_inv_826 Bool)) Bool (=>
                                     (not (= temp___skip_constant_824 true))
                                     (and (dynamic_property 1 r116b
                                     (first1 temp___expr_827)
                                     (last1 temp___expr_827))
                                     (and (= (first1 temp___expr_827) 1)
                                     (= (last1 temp___expr_827) r116b)))))

(define-fun default_initial_assumption ((temp___expr_829 us_t)
  (temp___skip_top_level_830 Bool)) Bool (and (= (first1 temp___expr_829) 1)
                                         (= (last1 temp___expr_829) r116b)))

(assert
;; defqtvc
 ;; File "very_longs.adb", line 379, characters 0-0
  (not
  (forall ((result____split_fields us_t) (new_overflow (_ BitVec 8))
  (overflow_mask (_ BitVec 8)) (old_overflow (_ BitVec 8))
  (very_longs__divide__full_left_shift__R116b__assume Int))
  (=> (dynamic_invariant number true false true true)
  (=> (dynamic_invariant
  (us_repqtmk result____split_discrs
  (us_split_fieldsqtmk result____split_fields)) false false true true)
  (=> (dynamic_invariant4 distance true false true true)
  (=>
  (= (to_rep (rec__very_longs__very_long__length result____split_discrs)) (+ 
  (to_rep (rec__very_longs__very_long__length (us_split_discrs1 number))) 1))
  (=> (= old_overflow #x00)
  (=> (dynamic_invariant2 old_overflow true false true true)
  (=> (dynamic_invariant2 new_overflow false false true true)
  (=> (dynamic_invariant2 overflow_mask false false true true)
  (=>
  (= (to_rep (rec__very_longs__very_long__length result____split_discrs)) very_longs__divide__full_left_shift__R116b__assume)
  (=> (= very_longs__divide__full_left_shift__R116b__assume r116b)
  (=> (dynamic_invariant3 r116b true false true true)
  (let ((temp___1287 (temp_____aggregate_def_1281 #x00 1 r116b)))
  (=> (= (first1 temp___1287) 1)
  (=> (= (last1 temp___1287) r116b)
  (=>
  (ite (<= (first1 temp___1287) (last1 temp___1287))
  (and (<= 1 r116b)
  (= (- (last1 temp___1287) (first1 temp___1287)) (- r116b 1))) (< r116b 1))
  (let ((temp___1289 (of_array (to_array temp___1287) (first1 temp___1287)
                     (last1 temp___1287))))
  (=>
  (ite (<= (first1 temp___1289) (last1 temp___1289))
  (and (<= (first1 result____split_fields) (last1 result____split_fields))
  (= (- (last1 temp___1289) (first1 temp___1289)) (- (last1
                                                     result____split_fields) 
  (first1 result____split_fields))))
  (< (last1 result____split_fields) (first1 result____split_fields)))
  (forall ((result____split_fields1 us_t))
  (=>
  (= result____split_fields1 (of_array (to_array temp___1289)
                             (first1 temp___1289) (last1 temp___1289)))
  (forall ((o (_ BitVec 8)))
  (=>
  (ite (< (- 8 distance) 8) (= o (bvshl #xFF ((_ int2bv 8) (- 8 distance))))
  (= o #x00))
  (forall ((overflow_mask1 (_ BitVec 8)))
  (=> (= overflow_mask1 o)
  (let ((temp___1295 (last1
                     (rec__very_longs__very_long__long_digits
                     (us_split_fields1 number)))))
  (forall ((i Int))
  (=> (= i 1)
  (=>
  (= (and (ite (<= 1 i) true false) (ite (<= i temp___1295) true false)) true)
  (forall ((result____split_fields2 us_t) (old_overflow1 (_ BitVec 8))
  (new_overflow1 (_ BitVec 8)) (i1 Int))
  (=>
  (= (and (ite (and
               (and
               (and (dynamic_invariant
               (us_repqtmk result____split_discrs
               (us_split_fieldsqtmk result____split_fields2)) false true true
               true)
               (forall ((temp___1307 Int))
               (=>
               (and (<= (first1 result____split_fields2) temp___1307)
               (<= temp___1307 (last1 result____split_fields2)))
               (=>
               (or (< temp___1295 temp___1307)
               (or (< temp___1307 1) (<= i1 temp___1307)))
               (= (select (to_array result____split_fields2) temp___1307) (select 
               (to_array result____split_fields1) temp___1307))))))
               (dynamic_invariant2 new_overflow1 false true true true))
               (dynamic_invariant2 old_overflow1 true true true true))
          true false) (ite (and (<= 1 i1)
                           (<= i1 (last1
                                  (rec__very_longs__very_long__long_digits
                                  (us_split_fields1 number)))))
                      true false)) true)
  (let ((o1 (- 8 distance)))
  (let ((temp___1296 (rec__very_longs__very_long__long_digits
                     (us_split_fields1 number))))
  (=> (and (<= (first1 temp___1296) i1) (<= i1 (last1 temp___1296)))
  (forall ((o2 (_ BitVec 8)))
  (=> (= (to_rep2 (select (to_array temp___1296) i1)) o2)
  (let ((o3 (bvand o2 overflow_mask1)))
  (let ((o4 (shift_right o3 o1)))
  (=>
  (and (shift_right__function_guard o4 o3 o1)
  (and (dynamic_invariant2 o4 true false true true)
  (= o4 (bvudiv o3 (ite (< o1 256) (bvshl #x01 ((_ int2bv 8) o1)) #x00)))))
  (forall ((new_overflow2 (_ BitVec 8)))
  (=> (= new_overflow2 o4)
  (=> (< distance 8)
  (<= (first1
      (rec__very_longs__very_long__long_digits (us_split_fields1 number))) i1))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
