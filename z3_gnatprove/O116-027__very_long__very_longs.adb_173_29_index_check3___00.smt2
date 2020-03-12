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

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun div1 (Int Int) Int)

(declare-fun mod1 (Int Int) Int)

;; Div_mod
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (= x (+ (* y (div1 x y)) (mod1 x y))))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div1 x y)) (<= (div1 x y) x)))))

;; Mod_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0))
  (and (< (- (abs1 y)) (mod1 x y)) (< (mod1 x y) (abs1 y))))))

;; Div_sign_pos
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< 0 y)) (<= 0 (div1 x y)))))

;; Div_sign_neg
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= x 0) (< 0 y)) (<= (div1 x y) 0))))

;; Mod_sign_pos
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (not (= y 0))) (<= 0 (mod1 x y)))))

;; Mod_sign_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= x 0) (not (= y 0))) (<= (mod1 x y) 0))))

;; Rounds_toward_zero
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (<= (abs1 (* (div1 x y) y)) (abs1 x)))))

;; Div_1
  (assert (forall ((x Int)) (= (div1 x 1) x)))

;; Mod_1
  (assert (forall ((x Int)) (= (mod1 x 1) 0)))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div1 x y) 0))))

;; Mod_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (mod1 x y) x))))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (div1 (+ (* x y) z) x) (+ y (div1 z x)))) :pattern ((div1
                                                            (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (mod1 (+ (* x y) z) x) (mod1 z x))) :pattern ((mod1 (+ (* x y) z) x)) )))

(define-fun mod2 ((x Int)
  (y Int)) Int (ite (< 0 y) (mod x y) (+ (mod x y) y)))

(declare-fun nth ((_ BitVec 8) Int) Bool)

(declare-fun lsr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun asr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun lsl ((_ BitVec 8) Int) (_ BitVec 8))

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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(declare-sort character 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (character character) Bool)

(declare-const dummy2 character)

(declare-datatypes ()
((character__ref (character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range3 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int character))))))
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
                           (= (to_rep (select a temp___idx_91)) (to_rep
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
  (= (to_rep (select a temp___idx_91)) (to_rep
                                       (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int character))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int character) (elts a))

(define-fun of_array ((a (Array Int character)) (f Int)
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

(declare-datatypes ()
((string____ref (string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(define-fun dynamic_invariant1 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(declare-sort digit_index_type 0)

(declare-fun digit_index_typeqtint (digit_index_type) Int)

;; digit_index_type'axiom
  (assert
  (forall ((i digit_index_type))
  (and (<= 1 (digit_index_typeqtint i)) (<= (digit_index_typeqtint i) 65536))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 65536)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (digit_index_type digit_index_type) Bool)

(declare-const dummy4 digit_index_type)

(declare-datatypes ()
((digit_index_type__ref
 (digit_index_type__refqtmk (digit_index_type__content digit_index_type)))))
(define-fun digit_index_type__ref_digit_index_type__content__projection ((a digit_index_type__ref)) digit_index_type 
  (digit_index_type__content a))

(define-fun to_rep2 ((x digit_index_type)) Int (digit_index_typeqtint x))

(declare-fun of_rep2 (Int) digit_index_type)

;; inversion_axiom
  (assert
  (forall ((x digit_index_type))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x digit_index_type)) (! (in_range4
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort tdigit_count_typeB 0)

(declare-fun tdigit_count_typeBqtint (tdigit_count_typeB) Int)

;; tdigit_count_typeB'axiom
  (assert
  (forall ((i tdigit_count_typeB))
  (and (<= (- 2147483648) (tdigit_count_typeBqtint i))
  (<= (tdigit_count_typeBqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (tdigit_count_typeB tdigit_count_typeB) Bool)

(declare-const dummy5 tdigit_count_typeB)

(declare-datatypes ()
((tdigit_count_typeB__ref
 (tdigit_count_typeB__refqtmk
 (tdigit_count_typeB__content tdigit_count_typeB)))))
(define-fun tdigit_count_typeB__ref_tdigit_count_typeB__content__projection ((a tdigit_count_typeB__ref)) tdigit_count_typeB 
  (tdigit_count_typeB__content a))

(define-fun to_rep3 ((x tdigit_count_typeB)) Int (tdigit_count_typeBqtint x))

(declare-fun of_rep3 (Int) tdigit_count_typeB)

;; inversion_axiom
  (assert
  (forall ((x tdigit_count_typeB))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x tdigit_count_typeB)) (! (in_range5
  (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range5 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-sort octet 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE6 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) (_ BitVec 8))

(declare-fun user_eq6 (octet octet) Bool)

(declare-const dummy6 octet)

(declare-datatypes () ((octet__ref (octet__refqtmk (octet__content octet)))))
(define-fun octet__ref_octet__content__projection ((a octet__ref)) octet 
  (octet__content a))

(declare-fun to_rep4 (octet) (_ BitVec 8))

(declare-fun of_rep4 ((_ BitVec 8)) octet)

;; inversion_axiom
  (assert
  (forall ((x octet))
  (! (= (of_rep4 (to_rep4 x)) x) :pattern ((to_rep4 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (= (to_rep4 (of_rep4 x)) x) :pattern ((to_rep4 (of_rep4 x))) )))

(define-fun to_int2 ((x octet)) Int (bv2int (to_rep4 x)))

;; range_int_axiom
  (assert
  (forall ((x octet)) (! (uint_in_range
  (to_int2 x)) :pattern ((to_int2 x)) )))

(declare-datatypes ()
((map__ref1 (map__refqtmk1 (map__content1 (Array Int octet))))))
(declare-fun slide1 ((Array Int octet) Int Int) (Array Int octet))

;; slide_eq
  (assert
  (forall ((a (Array Int octet)))
  (forall ((first2 Int))
  (! (= (slide1 a first2 first2) a) :pattern ((slide1 a first2 first2)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int octet)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq2 ((a (Array Int octet)) (a__first Int) (a__last Int)
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
                           (= (to_rep4 (select a temp___idx_154)) (to_rep4
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int octet)) (b (Array Int octet)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep4 (select a temp___idx_154)) (to_rep4
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t1 0)

(declare-fun first2 (t1) tdigit_count_typeB)

(declare-fun last2 (t1) tdigit_count_typeB)

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
                   (=> (<= low high) (and (in_range4 low) (in_range4 high))))))

(declare-datatypes ()
((us_t1 (us_tqtmk1 (elts1 (Array Int octet))(rt1 t1)))))
(define-fun to_array1 ((a us_t1)) (Array Int octet) (elts1 a))

(define-fun of_array1 ((a (Array Int octet)) (f Int)
  (l Int)) us_t1 (us_tqtmk1 a (mk1 f l)))

(define-fun first3 ((a us_t1)) Int (to_rep3 (first2 (rt1 a))))

(define-fun last3 ((a us_t1)) Int (to_rep3 (last2 (rt1 a))))

(define-fun length1 ((a us_t1)) Int (ite (<= (first3 a) (last3 a))
                                    (+ (- (last3 a) (first3 a)) 1) 0))

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

(define-fun bool_eq3 ((x us_t1)
  (y us_t1)) Bool (bool_eq2 (elts1 x) (to_rep3 (first2 (rt1 x)))
                  (to_rep3 (last2 (rt1 x))) (elts1 y)
                  (to_rep3 (first2 (rt1 y))) (to_rep3 (last2 (rt1 y)))))

(declare-fun user_eq7 (us_t1 us_t1) Bool)

(declare-const dummy7 us_t1)

(declare-datatypes ()
((digits_array_type__ref
 (digits_array_type__refqtmk (digits_array_type__content us_t1)))))
(define-fun digits_array_type__ref_digits_array_type__content__projection ((a digits_array_type__ref)) us_t1 
  (digits_array_type__content a))

(declare-datatypes () ((t18s__ref (t18s__refqtmk (t18s__content us_t1)))))
(define-fun t18s__ref_t18s__content__projection ((a t18s__ref)) us_t1 
  (t18s__content a))

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__very_longs__very_long__length digit_index_type)))))
(define-fun us_split_discrs_rec__very_longs__very_long__length__projection ((a us_split_discrs)) digit_index_type 
  (rec__very_longs__very_long__length a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk (rec__very_longs__very_long__long_digits us_t1)))))
(define-fun us_split_fields_rec__very_longs__very_long__long_digits__projection ((a us_split_fields)) us_t1 
  (rec__very_longs__very_long__long_digits a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq4 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep2
                           (rec__very_longs__very_long__length
                           (us_split_discrs1 a))) (to_rep2
                                                  (rec__very_longs__very_long__length
                                                  (us_split_discrs1 b))))
                        (= (bool_eq3
                           (rec__very_longs__very_long__long_digits
                           (us_split_fields1 a))
                           (rec__very_longs__very_long__long_digits
                           (us_split_fields1 b))) true))
                   true false))

(define-fun in_range6 ((rec__very_longs__very_long__length1 Int)
  (a us_split_discrs)) Bool (= rec__very_longs__very_long__length1 (to_rep2
                                                                   (rec__very_longs__very_long__length
                                                                   a))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

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

(declare-fun user_eq8 (us_rep us_rep) Bool)

(declare-const dummy8 us_rep)

(declare-datatypes ()
((very_long__ref (very_long__refqtmk (very_long__content us_rep)))))
(define-fun very_long__ref_very_long__content__projection ((a very_long__ref)) us_rep 
  (very_long__content a))

(declare-const number us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const result____split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant2 ((temp___expr_263 us_rep)
  (temp___is_init_259 Bool) (temp___skip_constant_260 Bool)
  (temp___do_toplevel_261 Bool)
  (temp___do_typ_inv_262 Bool)) Bool (let ((temp___264 (rec__very_longs__very_long__length
                                                       (us_split_discrs1
                                                       temp___expr_263))))
                                     (and (dynamic_property1 1
                                     (to_rep2 temp___264)
                                     (first3
                                     (rec__very_longs__very_long__long_digits
                                     (us_split_fields1 temp___expr_263)))
                                     (last3
                                     (rec__very_longs__very_long__long_digits
                                     (us_split_fields1 temp___expr_263))))
                                     (and
                                     (= (first3
                                        (rec__very_longs__very_long__long_digits
                                        (us_split_fields1 temp___expr_263))) 1)
                                     (= (last3
                                        (rec__very_longs__very_long__long_digits
                                        (us_split_fields1 temp___expr_263))) 
                                     (to_rep2 temp___264))))))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant3 ((temp___expr_250 (_ BitVec 8))
  (temp___is_init_246 Bool) (temp___skip_constant_247 Bool)
  (temp___do_toplevel_248 Bool) (temp___do_typ_inv_249 Bool)) Bool true)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const r32b Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const r35b Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(define-fun dynamic_invariant4 ((temp___expr_243 Int)
  (temp___is_init_239 Bool) (temp___skip_constant_240 Bool)
  (temp___do_toplevel_241 Bool)
  (temp___do_typ_inv_242 Bool)) Bool (=>
                                     (or (= temp___is_init_239 true)
                                     (<= 1 65536)) (in_range4
                                     temp___expr_243)))

(declare-datatypes () ((s31b__ref (s31b__refqtmk (s31b__content us_t1)))))
(define-fun s31b__ref_s31b__content__projection ((a s31b__ref)) us_t1 
  (s31b__content a))

(declare-datatypes () ((t34b__ref (t34b__refqtmk (t34b__content us_t1)))))
(define-fun t34b__ref_t34b__content__projection ((a t34b__ref)) us_t1 
  (t34b__content a))

(declare-fun temp_____aggregate_def_904 ((_ BitVec 8) Int Int) us_t1)

(define-fun dynamic_invariant5 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range3 temp___expr_74)))

(define-fun dynamic_invariant6 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

;; def_axiom
  (assert
  (forall ((temp___906 (_ BitVec 8)))
  (forall ((temp___907 Int) (temp___908 Int))
  (let ((temp___905 (temp_____aggregate_def_904 temp___906 temp___907
                    temp___908)))
  (=> (dynamic_invariant3 temp___906 true true true true)
  (and
  (=> (dynamic_property1 1 65536 temp___907 temp___908)
  (and (= (first3 temp___905) temp___907) (= (last3 temp___905) temp___908)))
  (forall ((temp___909 Int))
  (= (to_rep4 (select (to_array1 temp___905) temp___909)) temp___906))))))))

(define-fun dynamic_invariant7 ((temp___expr_257 us_t1)
  (temp___is_init_253 Bool) (temp___skip_constant_254 Bool)
  (temp___do_toplevel_255 Bool)
  (temp___do_typ_inv_256 Bool)) Bool (=>
                                     (not (= temp___skip_constant_254 true))
                                     (dynamic_property1 1 65536
                                     (first3 temp___expr_257)
                                     (last3 temp___expr_257))))

(define-fun dynamic_invariant8 ((temp___expr_458 us_t1)
  (temp___is_init_454 Bool) (temp___skip_constant_455 Bool)
  (temp___do_toplevel_456 Bool)
  (temp___do_typ_inv_457 Bool)) Bool (=>
                                     (not (= temp___skip_constant_455 true))
                                     (and (dynamic_property1 1 r32b
                                     (first3 temp___expr_458)
                                     (last3 temp___expr_458))
                                     (and (= (first3 temp___expr_458) 1)
                                     (= (last3 temp___expr_458) r32b)))))

(define-fun default_initial_assumption ((temp___expr_460 us_t1)
  (temp___skip_top_level_461 Bool)) Bool (and (= (first3 temp___expr_460) 1)
                                         (= (last3 temp___expr_460) r32b)))

(declare-const result____split_fields us_t1)

(declare-const index Int)

(declare-const string_index Int)

(declare-const h_digit (_ BitVec 8))

(declare-const l_digit (_ BitVec 8))

;; Assume
  (assert (dynamic_invariant1 number true false true true))

;; Assume
  (assert (dynamic_invariant2
  (us_repqtmk result____split_discrs
  (us_split_fieldsqtmk result____split_fields)) false false true true))

;; Assume
  (assert
  (= (length number) (* 2 (to_rep2
                          (rec__very_longs__very_long__length
                          result____split_discrs)))))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant4 index false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant string_index false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant3 h_digit false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant3 l_digit false false true true))

(declare-const very_longs__make_from_hex_string__R32b__assume Int)

;; Ensures
  (assert
  (= (to_rep2 (rec__very_longs__very_long__length result____split_discrs)) 
  very_longs__make_from_hex_string__R32b__assume))

;; Assume
  (assert (= very_longs__make_from_hex_string__R32b__assume r32b))

;; Assume
  (assert (dynamic_invariant4 r32b true false true true))

(define-fun temp___910 () us_t1 (temp_____aggregate_def_904 #x00 1 r32b))

;; Assume
  (assert (= (first3 temp___910) 1))

;; Assume
  (assert (= (last3 temp___910) r32b))

;; Assert
  (assert
  (ite (<= (first3 temp___910) (last3 temp___910))
  (and (<= 1 r32b) (= (- (last3 temp___910) (first3 temp___910)) (- r32b 1)))
  (< r32b 1)))

(define-fun temp___912 () us_t1 (of_array1 (to_array1 temp___910)
                                (first3 temp___910) (last3 temp___910)))

;; Assert
  (assert
  (ite (<= (first3 temp___912) (last3 temp___912))
  (and (<= (first3 result____split_fields) (last3 result____split_fields))
  (= (- (last3 temp___912) (first3 temp___912)) (- (last3
                                                   result____split_fields) 
  (first3 result____split_fields))))
  (< (last3 result____split_fields) (first3 result____split_fields))))

(declare-const result____split_fields1 us_t1)

;; H
  (assert
  (= result____split_fields1 (of_array1 (to_array1 temp___912)
                             (first3 temp___912) (last3 temp___912))))

(declare-const valid Bool)

;; H
  (assert (= valid (distinct 1 0)))

(define-fun o () Int (last3 result____split_fields1))

;; Ensures
  (assert (in_range4 o))

(declare-const index1 Int)

;; H
  (assert (= index1 o))

(define-fun o1 () Int (first1 number))

;; Ensures
  (assert (in_range2 o1))

(declare-const string_index1 Int)

;; H
  (assert (= string_index1 o1))

(define-fun o2 () Int (- (last1 number) string_index1))

;; Ensures
  (assert (in_range1 o2))

(define-fun o3 () Int (+ o2 1))

;; Ensures
  (assert (in_range1 o3))

(declare-const result____split_fields2 us_t1)

(declare-const index2 Int)

(declare-const string_index2 Int)

(declare-const h_digit1 (_ BitVec 8))

(declare-const l_digit1 (_ BitVec 8))

;; LoopInvariant
  (assert
  (= (div1 (+ (- (last1 number) string_index2) 1) 2) (+ (- index2 1) 1)))

;; LoopInvariant
  (assert
  (and (<= (first1 number) string_index2) (<= string_index2 (last1 number))))

;; LoopInvariant
  (assert (and (<= 1 index2) (<= index2 (last3 result____split_fields2))))

;; Assume
  (assert
  (and
  (and
  (and
  (and (dynamic_invariant string_index2 false true true true)
  (dynamic_invariant3 h_digit1 false true true true)) (dynamic_invariant3
  l_digit1 false true true true)) (dynamic_invariant2
  (us_repqtmk result____split_discrs
  (us_split_fieldsqtmk result____split_fields2)) false true true true))
  (dynamic_invariant4 index2 false true true true)))

;; Assert
  (assert
  (and (<= (first1 number) string_index2) (<= string_index2 (last1 number))))

(declare-const o4 Int)

;; Ensures
  (assert (= (to_rep (select (to_array number) string_index2)) o4))

(declare-const h_digit2 (_ BitVec 8))

(declare-const h_okay Bool)

;; Ensures
  (assert (dynamic_invariant3 h_digit2 true true true true))

(define-fun o5 () Int (+ string_index2 1))

;; Ensures
  (assert (in_range1 o5))

;; Assert
  (assert (and (<= (first1 number) o5) (<= o5 (last1 number))))

(declare-const o6 Int)

;; Ensures
  (assert (= (to_rep (select (to_array number) o5)) o6))

(declare-const l_digit2 (_ BitVec 8))

(declare-const l_okay Bool)

;; Ensures
  (assert (dynamic_invariant3 l_digit2 true true true true))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite (= (and h_okay l_okay) true) false true)))

;; H
  (assert (not (= spark__branch true)))

;; Assume
  (assert (= (last3 result____split_fields2) r35b))

;; Assume
  (assert (in_range5 r35b))

;; Assert
  (assert (and (<= 1 index2) (<= index2 r35b)))

(declare-const o7 octet)

;; Ensures
  (assert (= (to_rep4 o7) (bvadd (bvmul #x10 h_digit2) l_digit2)))

(assert
;; defqtvc
 ;; File "very_longs.ads", line 16, characters 0-0
  (not (<= (first3 result____split_fields2) index2)))
(check-sat)
