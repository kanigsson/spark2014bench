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

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 512))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 512)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (count_type count_type) Bool)

(declare-const dummy count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun to_rep ((x count_type)) Int (count_typeqtint x))

(declare-fun of_rep (Int) count_type)

;; inversion_axiom
  (assert
  (forall ((x count_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x count_type)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort octet 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 8))

(declare-fun user_eq1 (octet octet) Bool)

(declare-const dummy1 octet)

(declare-datatypes ((octet__ref 0))
(((octet__refqtmk (octet__content octet)))))
(define-fun octet__ref_octet__content__projection ((a octet__ref)) octet 
  (octet__content a))

(declare-fun to_rep1 (octet) (_ BitVec 8))

(declare-fun of_rep1 ((_ BitVec 8)) octet)

;; inversion_axiom
  (assert
  (forall ((x octet))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (= (to_rep1 (of_rep1 x)) x) :pattern ((to_rep1 (of_rep1 x))) )))

(define-fun to_int2 ((x octet)) Int (bv2nat (to_rep1 x)))

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
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
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
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const dummy2 (Array Int octet))

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

(declare-fun user_eq2 ((Array Int octet) (Array Int octet)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__messages__network_message__data (Array Int octet))(rec__messages__network_message__size count_type)))))
(define-fun us_split_fields_rec__messages__network_message__data__projection ((a us_split_fields)) (Array Int octet) 
  (rec__messages__network_message__data a))

(define-fun us_split_fields_rec__messages__network_message__size__projection ((a us_split_fields)) count_type 
  (rec__messages__network_message__size a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (bool_eq
                           (rec__messages__network_message__data
                           (us_split_fields1 a)) 1 512
                           (rec__messages__network_message__data
                           (us_split_fields1 b)) 1 512) true)
                        (= (to_rep
                           (rec__messages__network_message__size
                           (us_split_fields1 a))) (to_rep
                                                  (rec__messages__network_message__size
                                                  (us_split_fields1 b)))))
                   true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const messages__network_message__data__first__bit Int)

(declare-const messages__network_message__data__last__bit Int)

(declare-const messages__network_message__data__position Int)

;; messages__network_message__data__first__bit_axiom
  (assert (<= 0 messages__network_message__data__first__bit))

;; messages__network_message__data__last__bit_axiom
  (assert
  (< messages__network_message__data__first__bit messages__network_message__data__last__bit))

;; messages__network_message__data__position_axiom
  (assert (<= 0 messages__network_message__data__position))

(declare-const messages__network_message__size__first__bit Int)

(declare-const messages__network_message__size__last__bit Int)

(declare-const messages__network_message__size__position Int)

;; messages__network_message__size__first__bit_axiom
  (assert (<= 0 messages__network_message__size__first__bit))

;; messages__network_message__size__last__bit_axiom
  (assert
  (< messages__network_message__size__first__bit messages__network_message__size__last__bit))

;; messages__network_message__size__position_axiom
  (assert (<= 0 messages__network_message__size__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((network_message__ref 0))
(((network_message__refqtmk (network_message__content us_rep)))))
(define-fun network_message__ref_network_message__content__projection ((a network_message__ref)) us_rep 
  (network_message__content a))

(declare-sort octet1 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE3 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) (_ BitVec 8))

(declare-fun user_eq4 (octet1 octet1) Bool)

(declare-const dummy4 octet1)

(declare-datatypes ((octet__ref1 0))
(((octet__refqtmk1 (octet__content1 octet1)))))
(define-fun octet__ref_octet__content__2__projection ((a octet__ref1)) octet1 
  (octet__content1 a))

(declare-fun to_rep2 (octet1) (_ BitVec 8))

(declare-fun of_rep2 ((_ BitVec 8)) octet1)

;; inversion_axiom
  (assert
  (forall ((x octet1))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (= (to_rep2 (of_rep2 x)) x) :pattern ((to_rep2 (of_rep2 x))) )))

(define-fun to_int3 ((x octet1)) Int (bv2nat (to_rep2 x)))

;; range_int_axiom
  (assert
  (forall ((x octet1)) (! (uint_in_range
  (to_int3 x)) :pattern ((to_int3 x)) )))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int octet1))))))
(declare-fun slide1 ((Array Int octet1) Int Int) (Array Int octet1))

;; slide_eq
  (assert
  (forall ((a (Array Int octet1)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int octet1)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int octet1)) (a__first Int) (a__last Int)
  (b (Array Int octet1)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (to_rep2 (select a temp___idx_155)) (to_rep2
                                                                  (select b (+ (- b__first a__first) temp___idx_155)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int octet1)) (b (Array Int octet1)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (to_rep2 (select a temp___idx_155)) (to_rep2
                                         (select b (+ (- b__first a__first) temp___idx_155)))))))))))

(declare-const dummy5 (Array Int octet1))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size1 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq5 ((Array Int octet1) (Array Int octet1)) Bool)

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__messages__message__data (Array Int octet1))(rec__messages__message__size count_type)))))
(define-fun us_split_fields_rec__messages__message__data__projection ((a us_split_fields2)) (Array Int octet1) 
  (rec__messages__message__data a))

(define-fun us_split_fields_rec__messages__message__size__projection ((a us_split_fields2)) count_type 
  (rec__messages__message__size a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (bool_eq2
                            (rec__messages__message__data
                            (us_split_fields3 a)) 1 512
                            (rec__messages__message__data
                            (us_split_fields3 b)) 1 512) true)
                         (= (to_rep
                            (rec__messages__message__size
                            (us_split_fields3 a))) (to_rep
                                                   (rec__messages__message__size
                                                   (us_split_fields3 b)))))
                    true false))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const messages__message__data__first__bit Int)

(declare-const messages__message__data__last__bit Int)

(declare-const messages__message__data__position Int)

;; messages__message__data__first__bit_axiom
  (assert (<= 0 messages__message__data__first__bit))

;; messages__message__data__last__bit_axiom
  (assert
  (< messages__message__data__first__bit messages__message__data__last__bit))

;; messages__message__data__position_axiom
  (assert (<= 0 messages__message__data__position))

(declare-const messages__message__size__first__bit Int)

(declare-const messages__message__size__last__bit Int)

(declare-const messages__message__size__position Int)

;; messages__message__size__first__bit_axiom
  (assert (<= 0 messages__message__size__first__bit))

;; messages__message__size__last__bit_axiom
  (assert
  (< messages__message__size__first__bit messages__message__size__last__bit))

;; messages__message__size__position_axiom
  (assert (<= 0 messages__message__size__position))

(declare-fun user_eq6 (us_rep1 us_rep1) Bool)

(declare-const dummy6 us_rep1)

(declare-datatypes ((message__ref 0))
(((message__refqtmk (message__content us_rep1)))))
(define-fun message__ref_message__content__projection ((a message__ref)) us_rep1 
  (message__content a))

(declare-const high_level us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const r10b Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 512))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 512)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq7 (index_type index_type) Bool)

(declare-const dummy7 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun dynamic_invariant ((temp___expr_169 Int)
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (=>
                                     (or (= temp___is_init_165 true)
                                     (<= 0 512)) (in_range1 temp___expr_169)))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq8 (integer integer) Bool)

(declare-const dummy8 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep3 ((x integer)) Int (integerqtint x))

(declare-fun of_rep3 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range3 (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq9 (integer integer) Bool)

(declare-const dummy9 integer)

(declare-datatypes ((t11b__ref 0))
(((t11b__refqtmk (t11b__content integer)))))
(define-fun t11b__ref_t11b__content__projection ((a t11b__ref)) integer 
  (t11b__content a))

(declare-fun temp_____aggregate_def_279 ((_ BitVec 8)) (Array Int octet))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range3 temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_162 Int)
  (temp___is_init_158 Bool) (temp___skip_constant_159 Bool)
  (temp___do_toplevel_160 Bool)
  (temp___do_typ_inv_161 Bool)) Bool (=>
                                     (or (= temp___is_init_158 true)
                                     (<= 1 512)) (in_range2 temp___expr_162)))

(define-fun dynamic_invariant3 ((temp___expr_201 (_ BitVec 8))
  (temp___is_init_197 Bool) (temp___skip_constant_198 Bool)
  (temp___do_toplevel_199 Bool) (temp___do_typ_inv_200 Bool)) Bool true)

(define-fun dynamic_invariant4 ((temp___expr_176 (_ BitVec 8))
  (temp___is_init_172 Bool) (temp___skip_constant_173 Bool)
  (temp___do_toplevel_174 Bool) (temp___do_typ_inv_175 Bool)) Bool true)

;; def_axiom
  (assert
  (forall ((temp___281 (_ BitVec 8)))
  (=> (dynamic_invariant4 temp___281 true true true true)
  (forall ((temp___282 Int))
  (= (to_rep1 (select (temp_____aggregate_def_279 temp___281) temp___282)) temp___281)))))

;; r10b__def_axiom
  (assert
  (= r10b (to_rep
          (rec__messages__message__size (us_split_fields3 high_level)))))

(assert
;; defqtvc
 ;; File "messages.ads", line 46, characters 0-0
  (not
  (forall ((low_level__split_fields us_split_fields)
  (messages__to_network__L_2__R10b__assume Int)
  (low_level__split_fields1 us_split_fields)
  (messages__to_network__result us_split_fields))
  (=>
  (= low_level__split_fields (us_split_fieldsqtmk
                             (temp_____aggregate_def_279 #x00)
                             (rec__messages__message__size
                             (us_split_fields3 high_level))))
  (=>
  (= (to_rep (rec__messages__message__size (us_split_fields3 high_level))) messages__to_network__L_2__R10b__assume)
  (=> (= messages__to_network__L_2__R10b__assume r10b)
  (=> (dynamic_invariant r10b true false true true)
  (=>
  (let ((temp___284 r10b))
  (exists ((i Int))
  (and (= i 1)
  (ite (= (and (ite (<= 1 i) true false) (ite (<= i temp___284) true false)) true)
  (exists ((o (_ BitVec 8)))
  (and
  (= (to_rep2
     (select (rec__messages__message__data (us_split_fields3 high_level)) i)) o)
  (exists ((o1 octet))
  (and (= (to_rep1 o1) o)
  (exists ((low_level__split_fields2 us_split_fields))
  (and
  (= low_level__split_fields2 (us_split_fieldsqtmk
                              (store (rec__messages__network_message__data
                                     low_level__split_fields) i o1)
                              (rec__messages__network_message__size
                              low_level__split_fields)))
  (exists ((o2 Int))
  (and
  (= (to_rep (rec__messages__network_message__size low_level__split_fields2)) o2)
  (exists ((i1 Int))
  (and
  (and
  (= (to_rep (rec__messages__network_message__size low_level__split_fields1)) 
  (to_rep (rec__messages__network_message__size low_level__split_fields)))
  (forall ((item Int))
  (=> (and (<= 1 item) (<= item 512))
  (ite (and (<= 1 item) (<= item i1))
  (= (to_rep1
     (select (rec__messages__network_message__data low_level__split_fields1) item)) 
  (to_rep2
  (select (rec__messages__message__data (us_split_fields3 high_level)) item)))
  (= (to_rep1
     (select (rec__messages__network_message__data low_level__split_fields1) item)) #x00)))))
  (and
  (= (and (ite (and (dynamic_property 1 r10b i1)
               (and
               (forall ((temp___291 Int))
               (=> (and (<= 1 temp___291) (<= temp___291 512))
               (=>
               (or (< temp___284 temp___291)
               (or (< temp___291 1) (< i1 temp___291)))
               (= (select (rec__messages__network_message__data
                          low_level__split_fields1) temp___291) (select 
               (rec__messages__network_message__data low_level__split_fields) temp___291)))))
               (= (rec__messages__network_message__size
                  low_level__split_fields1) (rec__messages__network_message__size
                                            low_level__split_fields))))
          true false) (ite (and (<= 1 i1) (<= i1 r10b)) true false)) true)
  (= i1 temp___284))))))))))))
  (= low_level__split_fields1 low_level__split_fields)))))
  (=> (= messages__to_network__result low_level__split_fields1)
  (= (to_rep
     (rec__messages__network_message__size messages__to_network__result)) 
  (to_rep (rec__messages__message__size (us_split_fields3 high_level)))))))))))))
(check-sat)
(exit)
