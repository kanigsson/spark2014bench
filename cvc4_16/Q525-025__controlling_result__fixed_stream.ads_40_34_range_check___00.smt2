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

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort character 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (character character) Bool)

(declare-const dummy2 character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep1 (character) Int)

(declare-fun of_rep1 (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range3
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int character))))))
(declare-fun slide ((Array Int character) Int Int) (Array Int character))

;; slide_eq
  (assert
  (forall ((a (Array Int character)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int character)) (a__first Int) (a__last Int)
  (b (Array Int character)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_91 Int))
                           (=>
                           (and (<= a__first temp___idx_91)
                           (<= temp___idx_91 a__last))
                           (= (to_rep1 (select a temp___idx_91)) (to_rep1
                                                                 (select b (+ (- b__first a__first) temp___idx_91)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_91 Int))
  (=> (and (<= a__first temp___idx_91) (<= temp___idx_91 a__last))
  (= (to_rep1 (select a temp___idx_91)) (to_rep1
                                        (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (positive positive) Bool)

(declare-const dummy3 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun to_rep2 ((x integer)) Int (integerqtint x))

(declare-fun of_rep2 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep2 (first (mk f l))) f) (= (to_rep2 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range4 low) (in_range4 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int character))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int character) (elts a))

(define-fun of_array ((a (Array Int character)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep2 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep2 (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep2 (first (rt x)))
                 (to_rep2 (last (rt x))) (elts y) (to_rep2 (first (rt y)))
                 (to_rep2 (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ((string____ref 0))
(((string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(define-fun dynamic_invariant2 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(declare-const dummy5 (Array Int character))

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

(declare-fun user_eq5 ((Array Int character) (Array Int character)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__fixed_stream__object__width natural)(rec__fixed_stream__object__name (Array Int character))(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__fixed_stream__object__width__projection ((a us_split_fields)) natural 
  (rec__fixed_stream__object__width a))

(define-fun us_split_fields_rec__fixed_stream__object__name__projection ((a us_split_fields)) (Array Int character) 
  (rec__fixed_stream__object__name a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__fixed_stream__object__width
                           (us_split_fields1 a))) (to_rep
                                                  (rec__fixed_stream__object__width
                                                  (us_split_fields1 b))))
                        (= (bool_eq
                           (rec__fixed_stream__object__name
                           (us_split_fields1 a)) 1 20
                           (rec__fixed_stream__object__name
                           (us_split_fields1 b)) 1 20) true))
                   true false))

(declare-fun us_dispatch_eq (us_rep us_rep) Bool)

(declare-const us_tag Int)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const fixed_stream__object__width__first__bit Int)

(declare-const fixed_stream__object__width__last__bit Int)

(declare-const fixed_stream__object__width__position Int)

;; fixed_stream__object__width__first__bit_axiom
  (assert (<= 0 fixed_stream__object__width__first__bit))

;; fixed_stream__object__width__last__bit_axiom
  (assert
  (< fixed_stream__object__width__first__bit fixed_stream__object__width__last__bit))

;; fixed_stream__object__width__position_axiom
  (assert (<= 0 fixed_stream__object__width__position))

(declare-const fixed_stream__object__name__first__bit Int)

(declare-const fixed_stream__object__name__last__bit Int)

(declare-const fixed_stream__object__name__position Int)

;; fixed_stream__object__name__first__bit_axiom
  (assert (<= 0 fixed_stream__object__name__first__bit))

;; fixed_stream__object__name__last__bit_axiom
  (assert
  (< fixed_stream__object__name__first__bit fixed_stream__object__name__last__bit))

;; fixed_stream__object__name__position_axiom
  (assert (<= 0 fixed_stream__object__name__position))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ((object__ref 0))
(((object__refqtmk (object__content us_rep)))))
(define-fun object__ref_object__content__projection ((a object__ref)) us_rep 
  (object__content a))

(declare-fun elements (us_rep) Int)

(declare-fun elements__function_guard (Int us_rep) Bool)

(declare-fun elements1 (Int us_rep) Int)

(declare-fun elements__function_guard1 (Int Int us_rep) Bool)

(declare-fun temp_____aggregate_def_168 (Int) (Array Int character))

(define-fun default_initial_assumption ((temp___expr_166 us_rep)
  (temp___skip_top_level_167 Bool)) Bool (and
                                         (= (attr__tag temp___expr_166) 
                                         us_tag)
                                         (and
                                         (= (to_rep
                                            (rec__fixed_stream__object__width
                                            (us_split_fields1
                                            temp___expr_166))) 0)
                                         (= (rec__fixed_stream__object__name
                                            (us_split_fields1
                                            temp___expr_166)) (temp_____aggregate_def_168
                                                              0)))))

;; elements__post_axiom
  (assert
  (forall ((this us_rep))
  (! (let ((result (elements this)))
     (=> (elements__function_guard result this) (dynamic_invariant1 result
     true false true true))) :pattern ((elements this)) )))

;; elements__post__dispatch_axiom
  (assert
  (forall ((attr__tag1 Int))
  (forall ((this us_rep))
  (! (let ((result (elements1 attr__tag1 this)))
     (=> (elements__function_guard1 result attr__tag1 this)
     (dynamic_invariant1 result true false true true))) :pattern ((elements1
                                                                  attr__tag1
                                                                  this)) ))))

;; fixed_stream__object__compat_axiom
  (assert
  (forall ((this us_rep))
  (! (=> (elements__function_guard1 (elements1 us_tag this) us_tag this)
     (and
     (forall ((this1 us_rep)) (elements__function_guard (elements this1)
     this1)) (= (elements this) (elements1 us_tag this)))) :pattern (
  (elements1 us_tag this)) )))

;; elements__def_axiom
  (assert
  (forall ((this us_rep))
  (! (= (elements this) (to_rep
                        (rec__fixed_stream__object__width
                        (us_split_fields1 this)))) :pattern ((elements this)) )))

(declare-sort tstream_element_offsetB 0)

(declare-fun tstream_element_offsetBqtint (tstream_element_offsetB) Int)

;; tstream_element_offsetB'axiom
  (assert
  (forall ((i tstream_element_offsetB))
  (and (<= (- 9223372036854775808) (tstream_element_offsetBqtint i))
  (<= (tstream_element_offsetBqtint i) 9223372036854775807))))

(define-fun in_range5 ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                     (<= x 9223372036854775807)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq7 (tstream_element_offsetB tstream_element_offsetB) Bool)

(declare-const dummy7 tstream_element_offsetB)

(declare-datatypes ((tstream_element_offsetB__ref 0))
(((tstream_element_offsetB__refqtmk
  (tstream_element_offsetB__content tstream_element_offsetB)))))
(define-fun tstream_element_offsetB__ref_tstream_element_offsetB__content__projection ((a tstream_element_offsetB__ref)) tstream_element_offsetB 
  (tstream_element_offsetB__content a))

(define-fun to_rep3 ((x tstream_element_offsetB)) Int (tstream_element_offsetBqtint
                                                      x))

(declare-fun of_rep3 (Int) tstream_element_offsetB)

;; inversion_axiom
  (assert
  (forall ((x tstream_element_offsetB))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x tstream_element_offsetB)) (! (in_range5
  (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range5 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-sort stream_element_offset 0)

(declare-fun stream_element_offsetqtint (stream_element_offset) Int)

;; stream_element_offset'axiom
  (assert
  (forall ((i stream_element_offset))
  (and (<= (- 9223372036854775808) (stream_element_offsetqtint i))
  (<= (stream_element_offsetqtint i) 9223372036854775807))))

(define-fun in_range6 ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                     (<= x 9223372036854775807)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq8 (stream_element_offset stream_element_offset) Bool)

(declare-const dummy8 stream_element_offset)

(declare-datatypes ((stream_element_offset__ref 0))
(((stream_element_offset__refqtmk
  (stream_element_offset__content stream_element_offset)))))
(define-fun stream_element_offset__ref_stream_element_offset__content__projection ((a stream_element_offset__ref)) stream_element_offset 
  (stream_element_offset__content a))

(declare-sort stream_element 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE7 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) (_ BitVec 8))

(declare-fun user_eq9 (stream_element stream_element) Bool)

(declare-const dummy9 stream_element)

(declare-datatypes ((stream_element__ref 0))
(((stream_element__refqtmk (stream_element__content stream_element)))))
(define-fun stream_element__ref_stream_element__content__projection ((a stream_element__ref)) stream_element 
  (stream_element__content a))

(declare-fun to_rep4 (stream_element) (_ BitVec 8))

(declare-fun of_rep4 ((_ BitVec 8)) stream_element)

;; inversion_axiom
  (assert
  (forall ((x stream_element))
  (! (= (of_rep4 (to_rep4 x)) x) :pattern ((to_rep4 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (= (to_rep4 (of_rep4 x)) x) :pattern ((to_rep4 (of_rep4 x))) )))

(define-fun to_int2 ((x stream_element)) Int (bv2nat (to_rep4 x)))

;; range_int_axiom
  (assert
  (forall ((x stream_element)) (! (uint_in_range
  (to_int2 x)) :pattern ((to_int2 x)) )))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int stream_element))))))
(declare-fun slide1 ((Array Int stream_element) Int
  Int) (Array Int stream_element))

;; slide_eq
  (assert
  (forall ((a (Array Int stream_element)))
  (forall ((first2 Int))
  (! (= (slide1 a first2 first2) a) :pattern ((slide1 a first2 first2)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int stream_element)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq3 ((a (Array Int stream_element)) (a__first Int)
  (a__last Int) (b (Array Int stream_element)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_157 Int))
                           (=>
                           (and (<= a__first temp___idx_157)
                           (<= temp___idx_157 a__last))
                           (= (to_rep4 (select a temp___idx_157)) (to_rep4
                                                                  (select b (+ (- b__first a__first) temp___idx_157)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int stream_element)) (b (Array Int stream_element)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq3 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_157 Int))
  (=> (and (<= a__first temp___idx_157) (<= temp___idx_157 a__last))
  (= (to_rep4 (select a temp___idx_157)) (to_rep4
                                         (select b (+ (- b__first a__first) temp___idx_157)))))))))))

(declare-sort t1 0)

(declare-fun first2 (t1) tstream_element_offsetB)

(declare-fun last2 (t1) tstream_element_offsetB)

(declare-fun mk1 (Int Int) t1)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range5 f)
     (=> (in_range5 l)
     (and (= (to_rep3 (first2 (mk1 f l))) f)
     (= (to_rep3 (last2 (mk1 f l))) l)))) :pattern ((mk1 f l)) )))

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range5 low)
                   (and (in_range5 high)
                   (=> (<= low high) (and (in_range6 low) (in_range6 high))))))

(declare-datatypes ((us_t1 0))
(((us_tqtmk1 (elts1 (Array Int stream_element))(rt1 t1)))))
(define-fun to_array1 ((a us_t1)) (Array Int stream_element) (elts1 a))

(define-fun of_array1 ((a (Array Int stream_element)) (f Int)
  (l Int)) us_t1 (us_tqtmk1 a (mk1 f l)))

(define-fun first3 ((a us_t1)) Int (to_rep3 (first2 (rt1 a))))

(define-fun last3 ((a us_t1)) Int (to_rep3 (last2 (rt1 a))))

(define-fun length1 ((a us_t1)) Int (ite (<= (first3 a) (last3 a))
                                    (+ (- (last3 a) (first3 a)) 1) 0))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const component__size2 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; component__size_axiom
  (assert (<= 0 component__size2))

;; alignment_axiom
  (assert (<= 0 alignment3))

(define-fun bool_eq4 ((x us_t1)
  (y us_t1)) Bool (bool_eq3 (elts1 x) (to_rep3 (first2 (rt1 x)))
                  (to_rep3 (last2 (rt1 x))) (elts1 y)
                  (to_rep3 (first2 (rt1 y))) (to_rep3 (last2 (rt1 y)))))

(declare-fun user_eq10 (us_t1 us_t1) Bool)

(declare-const dummy10 us_t1)

(declare-datatypes ((stream_element_array__ref 0))
(((stream_element_array__refqtmk (stream_element_array__content us_t1)))))
(define-fun stream_element_array__ref_stream_element_array__content__projection ((a stream_element_array__ref)) us_t1 
  (stream_element_array__content a))

(declare-fun null_string (us_rep) us_t1)

(declare-fun null_string__function_guard (us_t1 us_rep) Bool)

(declare-fun null_string1 (Int us_rep) us_t1)

(declare-fun null_string__function_guard1 (us_t1 Int us_rep) Bool)

(define-fun dynamic_invariant3 ((temp___expr_203 us_t1)
  (temp___is_init_199 Bool) (temp___skip_constant_200 Bool)
  (temp___do_toplevel_201 Bool)
  (temp___do_typ_inv_202 Bool)) Bool (=>
                                     (not (= temp___skip_constant_200 true))
                                     (dynamic_property1
                                     (- 9223372036854775808)
                                     9223372036854775807
                                     (first3 temp___expr_203)
                                     (last3 temp___expr_203))))

;; null_string__post_axiom
  (assert
  (forall ((this us_rep))
  (! (let ((result (null_string this)))
     (and
     (forall ((this1 us_rep)) (elements__function_guard (elements this1)
     this1))
     (=> (null_string__function_guard result this)
     (and (= (length1 result) (elements this)) (dynamic_invariant3 result
     true false true true))))) :pattern ((null_string this)) )))

;; null_string__post__dispatch_axiom
  (assert
  (forall ((attr__tag1 Int))
  (forall ((this us_rep))
  (! (let ((result (null_string1 attr__tag1 this)))
     (=> (null_string__function_guard1 result attr__tag1 this)
     (dynamic_invariant3 result true false true true))) :pattern ((null_string1
                                                                  attr__tag1
                                                                  this)) ))))

;; fixed_stream__object__compat_axiom
  (assert
  (forall ((this us_rep))
  (! (=> (null_string__function_guard1 (null_string1 us_tag this) us_tag
     this)
     (and
     (forall ((this1 us_rep)) (null_string__function_guard
     (null_string this1) this1))
     (= (null_string this) (null_string1 us_tag this)))) :pattern ((null_string1
                                                                   us_tag
                                                                   this)) )))

(declare-const this us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const in_string us_t)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const out_stream__first tstream_element_offsetB)

(declare-const out_stream__last tstream_element_offsetB)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const r19b Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(define-fun dynamic_invariant4 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range4
                                    temp___expr_46)))

(define-fun dynamic_invariant5 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range3 temp___expr_74)))

;; def_axiom
  (assert
  (forall ((temp___170 Int))
  (=> (dynamic_invariant5 temp___170 true true true true)
  (forall ((temp___171 Int))
  (= (to_rep1 (select (temp_____aggregate_def_168 temp___170) temp___171)) temp___170)))))

(define-fun dynamic_invariant6 ((temp___expr_196 (_ BitVec 8))
  (temp___is_init_192 Bool) (temp___skip_constant_193 Bool)
  (temp___do_toplevel_194 Bool) (temp___do_typ_inv_195 Bool)) Bool true)

(define-fun dynamic_invariant7 ((temp___expr_186 Int)
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (=>
                                     (or (= temp___is_init_182 true)
                                     (<= (- 9223372036854775808) 9223372036854775807))
                                     (in_range6 temp___expr_186)))

(assert
;; defqtvc
 ;; File "fixed_stream.ads", line 38, characters 0-0
  (not
  (forall ((o Int))
  (=> (dynamic_invariant2 in_string true false true true)
  (=>
  (= (to_rep (rec__fixed_stream__object__width (us_split_fields1 this))) o)
  (let ((o1 (length in_string)))
  (=> (in_range1 o1)
  (let ((o2 (min o1 o)))
  (=> (in_range2 o2)
  (forall ((len Int))
  (=> (= len o2)
  (=> (dynamic_invariant1 len true false true true)
  (let ((o3 this))
  (let ((fixed_stream__convert__out_stream__assume (null_string o3)))
  (=> (forall ((o4 us_rep)) (elements__function_guard (elements o4) o4))
  (=>
  (and (null_string__function_guard fixed_stream__convert__out_stream__assume
  o3)
  (and (dynamic_invariant3 fixed_stream__convert__out_stream__assume true
  false true true)
  (= (length1 fixed_stream__convert__out_stream__assume) (elements o3))))
  (forall ((out_stream (Array Int stream_element)))
  (=> (= out_stream (to_array1 fixed_stream__convert__out_stream__assume))
  (=>
  (= (to_rep3 out_stream__first) (first3
                                 fixed_stream__convert__out_stream__assume))
  (=>
  (= (to_rep3 out_stream__last) (last3
                                fixed_stream__convert__out_stream__assume))
  (=> (dynamic_property1 (- 9223372036854775808) 9223372036854775807
  (to_rep3 out_stream__first) (to_rep3 out_stream__last))
  (=> (= (- len 1) r19b)
  (=> (dynamic_invariant r19b true false true true)
  (forall ((out_stream1 (Array Int stream_element)))
  (=>
  (let ((temp___301 r19b))
  (exists ((i Int))
  (and (= i 1)
  (ite (= (and (ite (<= 1 i) true false) (ite (<= i temp___301) true false)) true)
  (exists ((out_stream2 (Array Int stream_element)) (i1 Int))
  (and
  (= (and (ite true true false) (ite (and (<= 1 i1) (<= i1 r19b)) true false)) true)
  (let ((o4 (+ (first1 in_string) i1)))
  (and (in_range1 o4)
  (and (and (<= (first1 in_string) o4) (<= o4 (last1 in_string)))
  (exists ((o5 Int))
  (and (= (to_rep1 (select (to_array in_string) o4)) o5)
  (exists ((o6 stream_element))
  (and (= (to_rep4 o6) ((_ int2bv 8) o5))
  (exists ((o7 Int))
  (and (= (to_rep3 out_stream__first) o7)
  (let ((o8 (+ o7 i1)))
  (and (in_range5 o8)
  (and
  (and (<= (to_rep3 out_stream__first) o8)
  (<= o8 (to_rep3 out_stream__last)))
  (and (= out_stream1 (store out_stream2 o8 o6)) (= i1 temp___301))))))))))))))))
  (= out_stream1 out_stream)))))
  (forall ((o4 Int))
  (=> (= (to_rep3 out_stream__last) o4)
  (forall ((o5 Int))
  (=> (= (to_rep3 out_stream__first) o5)
  (forall ((fixed_stream__convert__result us_t1))
  (=> (= fixed_stream__convert__result (of_array1 out_stream1 o5 o4))
  (let ((o6 this))
  (let ((o7 (elements o6)))
  (=>
  (and (elements__function_guard o7 o6)
  (and (dynamic_invariant1 o7 true false true true)
  (= o7 (to_rep (rec__fixed_stream__object__width (us_split_fields1 o6))))))
  (in_range1 (length1 fixed_stream__convert__result))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
