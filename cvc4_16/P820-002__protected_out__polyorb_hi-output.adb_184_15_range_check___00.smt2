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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

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

(declare-fun user_eq (positive positive) Bool)

(declare-const dummy positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-sort character 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (character character) Bool)

(declare-const dummy1 character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
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
  (forall ((x character)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

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

(declare-fun concat1 ((Array Int character) Int Int (Array Int character) Int
  Int) (Array Int character))

;; concat_def
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (forall ((i Int))
  (! (and
     (=> (and (<= a_first i) (<= i a_last))
     (= (select (concat1 a a_first a_last b b_first b_last) i) (select a i)))
     (=> (< a_last i)
     (= (select (concat1 a a_first a_last b b_first b_last) i) (select b (+ (- i a_last) (- b_first 1)))))) :pattern ((select 
  (concat1 a a_first a_last b b_first b_last) i)) )))))

(declare-fun concat_singleton_left (character Int (Array Int character) Int
  Int) (Array Int character))

;; concat_singleton_left_def
  (assert
  (forall ((a character))
  (forall ((b (Array Int character)))
  (forall ((a_first Int) (b_first Int) (b_last Int))
  (! (and
     (= (select (concat_singleton_left a a_first b b_first b_last) a_first) a)
     (forall ((i Int))
     (! (=> (< a_first i)
        (= (select (concat_singleton_left a a_first b b_first b_last) i) (select b (+ (- i a_first) (- b_first 1))))) :pattern ((select 
     (concat_singleton_left a a_first b b_first b_last) i)) ))) :pattern (
  (concat_singleton_left a a_first b b_first b_last)) )))))

(declare-fun concat_singleton_right ((Array Int character) Int Int
  character) (Array Int character))

;; concat_singleton_right_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((b character))
  (forall ((a_first Int) (a_last Int))
  (! (and
     (= (select (concat_singleton_right a a_first a_last b) (+ a_last 1)) b)
     (forall ((i Int))
     (! (=> (and (<= a_first i) (<= i a_last))
        (= (select (concat_singleton_right a a_first a_last b) i) (select a i))) :pattern ((select 
     (concat_singleton_right a a_first a_last b) i)) :pattern ((select a i)) ))) :pattern (
  (concat_singleton_right a a_first a_last b)) )))))

(declare-fun concat_singletons (character Int
  character) (Array Int character))

;; concat_singletons_def
  (assert
  (forall ((a character) (b character))
  (forall ((a_first Int))
  (! (and (= (select (concat_singletons a a_first b) a_first) a)
     (= (select (concat_singletons a a_first b) (+ a_first 1)) b)) :pattern (
  (concat_singletons a a_first b)) ))))

(declare-fun singleton1 (character Int) (Array Int character))

;; singleton_def
  (assert
  (forall ((v character))
  (forall ((i Int))
  (! (= (select (singleton1 v i) i) v) :pattern ((select (singleton1 v i) i)) ))))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range3 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range3 f)
     (=> (in_range3 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range3 low)
                   (and (in_range3 high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int character))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int character) (elts a))

(define-fun of_array ((a (Array Int character)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
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

(declare-datatypes ((string____ref 0))
(((string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range3 temp___expr_18)))

(declare-sort lockT 0)

(declare-fun user_eq4 (lockT lockT) Bool)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-datatypes ((lockT__ref 0))
(((lockT__refqtmk (lockT__content lockT)))))
(define-fun lockT__ref_lockT__content__projection ((a lockT__ref)) lockT 
  (lockT__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort tstream_element_offsetB 0)

(declare-fun tstream_element_offsetBqtint (tstream_element_offsetB) Int)

;; tstream_element_offsetB'axiom
  (assert
  (forall ((i tstream_element_offsetB))
  (and (<= (- 9223372036854775808) (tstream_element_offsetBqtint i))
  (<= (tstream_element_offsetBqtint i) 9223372036854775807))))

(define-fun in_range4 ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                     (<= x 9223372036854775807)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (tstream_element_offsetB tstream_element_offsetB) Bool)

(declare-const dummy4 tstream_element_offsetB)

(declare-datatypes ((tstream_element_offsetB__ref 0))
(((tstream_element_offsetB__refqtmk
  (tstream_element_offsetB__content tstream_element_offsetB)))))
(define-fun tstream_element_offsetB__ref_tstream_element_offsetB__content__projection ((a tstream_element_offsetB__ref)) tstream_element_offsetB 
  (tstream_element_offsetB__content a))

(define-fun to_rep2 ((x tstream_element_offsetB)) Int (tstream_element_offsetBqtint
                                                      x))

(declare-fun of_rep2 (Int) tstream_element_offsetB)

;; inversion_axiom
  (assert
  (forall ((x tstream_element_offsetB))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x tstream_element_offsetB)) (! (in_range4
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort stream_element_offset 0)

(declare-fun stream_element_offsetqtint (stream_element_offset) Int)

;; stream_element_offset'axiom
  (assert
  (forall ((i stream_element_offset))
  (and (<= (- 9223372036854775808) (stream_element_offsetqtint i))
  (<= (stream_element_offsetqtint i) 9223372036854775807))))

(define-fun in_range5 ((x Int)) Bool (and (<= (- 9223372036854775808) x)
                                     (<= x 9223372036854775807)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq6 (stream_element_offset stream_element_offset) Bool)

(declare-const dummy5 stream_element_offset)

(declare-datatypes ((stream_element_offset__ref 0))
(((stream_element_offset__refqtmk
  (stream_element_offset__content stream_element_offset)))))
(define-fun stream_element_offset__ref_stream_element_offset__content__projection ((a stream_element_offset__ref)) stream_element_offset 
  (stream_element_offset__content a))

(declare-sort stream_element 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE6 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) (_ BitVec 8))

(declare-fun user_eq7 (stream_element stream_element) Bool)

(declare-const dummy6 stream_element)

(declare-datatypes ((stream_element__ref 0))
(((stream_element__refqtmk (stream_element__content stream_element)))))
(define-fun stream_element__ref_stream_element__content__projection ((a stream_element__ref)) stream_element 
  (stream_element__content a))

(declare-fun to_rep3 (stream_element) (_ BitVec 8))

(declare-fun of_rep3 ((_ BitVec 8)) stream_element)

;; inversion_axiom
  (assert
  (forall ((x stream_element))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (= (to_rep3 (of_rep3 x)) x) :pattern ((to_rep3 (of_rep3 x))) )))

(define-fun to_int2 ((x stream_element)) Int (bv2nat (to_rep3 x)))

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

(define-fun bool_eq2 ((a (Array Int stream_element)) (a__first Int)
  (a__last Int) (b (Array Int stream_element)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep3 (select a temp___idx_154)) (to_rep3
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int stream_element)) (b (Array Int stream_element)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq2 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep3 (select a temp___idx_154)) (to_rep3
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t1 0)

(declare-fun first2 (t1) tstream_element_offsetB)

(declare-fun last2 (t1) tstream_element_offsetB)

(declare-fun mk1 (Int Int) t1)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range4 f)
     (=> (in_range4 l)
     (and (= (to_rep2 (first2 (mk1 f l))) f)
     (= (to_rep2 (last2 (mk1 f l))) l)))) :pattern ((mk1 f l)) )))

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range4 low)
                   (and (in_range4 high)
                   (=> (<= low high) (and (in_range5 low) (in_range5 high))))))

(declare-datatypes ((us_t1 0))
(((us_tqtmk1 (elts1 (Array Int stream_element))(rt1 t1)))))
(define-fun to_array1 ((a us_t1)) (Array Int stream_element) (elts1 a))

(define-fun of_array1 ((a (Array Int stream_element)) (f Int)
  (l Int)) us_t1 (us_tqtmk1 a (mk1 f l)))

(define-fun first3 ((a us_t1)) Int (to_rep2 (first2 (rt1 a))))

(define-fun last3 ((a us_t1)) Int (to_rep2 (last2 (rt1 a))))

(define-fun length2 ((a us_t1)) Int (ite (<= (first3 a) (last3 a))
                                    (+ (- (last3 a) (first3 a)) 1) 0))

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

(define-fun bool_eq3 ((x us_t1)
  (y us_t1)) Bool (bool_eq2 (elts1 x) (to_rep2 (first2 (rt1 x)))
                  (to_rep2 (last2 (rt1 x))) (elts1 y)
                  (to_rep2 (first2 (rt1 y))) (to_rep2 (last2 (rt1 y)))))

(declare-fun user_eq8 (us_t1 us_t1) Bool)

(declare-const dummy7 us_t1)

(declare-datatypes ((stream_element_array__ref 0))
(((stream_element_array__refqtmk (stream_element_array__content us_t1)))))
(define-fun stream_element_array__ref_stream_element_array__content__projection ((a stream_element_array__ref)) us_t1 
  (stream_element_array__content a))

(declare-const stream us_t1)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const mode Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const hex (Array Int character))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const nil (Array Int character))

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const r19b Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const r20b Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-sort verbosity 0)

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq9 (verbosity verbosity) Bool)

(declare-const dummy8 verbosity)

(declare-datatypes ((verbosity__ref 0))
(((verbosity__refqtmk (verbosity__content verbosity)))))
(define-fun verbosity__ref_verbosity__content__projection ((a verbosity__ref)) verbosity 
  (verbosity__content a))

(define-fun dynamic_invariant1 ((temp___expr_166 Int)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (<= 0 2)) (in_range6 temp___expr_166)))

(define-fun dynamic_invariant2 ((temp___expr_191 us_t1)
  (temp___is_init_187 Bool) (temp___skip_constant_188 Bool)
  (temp___do_toplevel_189 Bool)
  (temp___do_typ_inv_190 Bool)) Bool (=>
                                     (not (= temp___skip_constant_188 true))
                                     (dynamic_property1
                                     (- 9223372036854775808)
                                     9223372036854775807
                                     (first3 temp___expr_191)
                                     (last3 temp___expr_191))))

(declare-sort output_position 0)

(declare-fun output_positionqtint (output_position) Int)

;; output_position'axiom
  (assert
  (forall ((i output_position))
  (and (<= 1 (output_positionqtint i)) (<= (output_positionqtint i) 48))))

(define-fun in_range7 ((x Int)) Bool (and (<= 1 x) (<= x 48)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq10 (output_position output_position) Bool)

(declare-const dummy9 output_position)

(declare-datatypes ((output_position__ref 0))
(((output_position__refqtmk (output_position__content output_position)))))
(define-fun output_position__ref_output_position__content__projection ((a output_position__ref)) output_position 
  (output_position__content a))

(define-fun dynamic_invariant3 ((temp___expr_286 Int)
  (temp___is_init_282 Bool) (temp___skip_constant_283 Bool)
  (temp___do_toplevel_284 Bool)
  (temp___do_typ_inv_285 Bool)) Bool (=>
                                     (or (= temp___is_init_282 true)
                                     (<= 1 48)) (in_range7 temp___expr_286)))

(declare-fun temp___String_Literal_158 (tuple0) (Array Int character))

;; temp___String_Literal_158__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_158 us_void_param) 0)) 48)
     (= (to_rep (select (temp___String_Literal_158 us_void_param) 1)) 49))
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_158 us_void_param) 2)) 50)
     (= (to_rep (select (temp___String_Literal_158 us_void_param) 3)) 51))
     (and
     (= (to_rep (select (temp___String_Literal_158 us_void_param) 4)) 52)
     (= (to_rep (select (temp___String_Literal_158 us_void_param) 5)) 53)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_158 us_void_param) 6)) 54)
     (= (to_rep (select (temp___String_Literal_158 us_void_param) 7)) 55))
     (= (to_rep (select (temp___String_Literal_158 us_void_param) 8)) 56)))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_158 us_void_param) 9)) 57)
     (= (to_rep (select (temp___String_Literal_158 us_void_param) 10)) 65))
     (and
     (= (to_rep (select (temp___String_Literal_158 us_void_param) 11)) 66)
     (= (to_rep (select (temp___String_Literal_158 us_void_param) 12)) 67)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_158 us_void_param) 13)) 68)
     (= (to_rep (select (temp___String_Literal_158 us_void_param) 14)) 69))
     (= (to_rep (select (temp___String_Literal_158 us_void_param) 15)) 70))))) :pattern (
  (temp___String_Literal_158 us_void_param)) )))

(declare-fun ada___polyorb_hi__output__nil__aggregate_def (Int) (Array Int character))

(declare-datatypes ((t22b__ref 0))
(((t22b__refqtmk (t22b__content us_t)))))
(define-fun t22b__ref_t22b__content__projection ((a t22b__ref)) us_t 
  (t22b__content a))

(define-fun dynamic_invariant4 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

(define-fun dynamic_invariant5 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range2 temp___expr_74)))

(define-fun dynamic_invariant6 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

;; hex__def_axiom
  (assert (= hex (temp___String_Literal_158 Tuple0)))

;; nil__def_axiom
  (assert (= nil (ada___polyorb_hi__output__nil__aggregate_def 32)))

;; def_axiom
  (assert
  (forall ((temp___160 Int))
  (=> (dynamic_invariant5 temp___160 true true true true)
  (forall ((temp___161 Int))
  (= (to_rep
     (select (ada___polyorb_hi__output__nil__aggregate_def temp___160) temp___161)) temp___160)))))

(define-fun dynamic_invariant7 ((temp___expr_184 (_ BitVec 8))
  (temp___is_init_180 Bool) (temp___skip_constant_181 Bool)
  (temp___do_toplevel_182 Bool) (temp___do_typ_inv_183 Bool)) Bool true)

(define-fun dynamic_invariant8 ((temp___expr_177 Int)
  (temp___is_init_173 Bool) (temp___skip_constant_174 Bool)
  (temp___do_toplevel_175 Bool)
  (temp___do_typ_inv_176 Bool)) Bool (=>
                                     (or (= temp___is_init_173 true)
                                     (<= (- 9223372036854775808) 9223372036854775807))
                                     (in_range5 temp___expr_177)))

(assert
;; defqtvc
 ;; File "polyorb_hi-output.ads", line 87, characters 0-0
  (not
  (forall ((index Int) (output (Array Int character)))
  (=> (= (temp___String_Literal_158 Tuple0) hex)
  (=> (= (ada___polyorb_hi__output__nil__aggregate_def 32) nil)
  (=> (dynamic_invariant2 stream true false true true)
  (=> (dynamic_invariant1 mode true false true true)
  (=> (= index 1)
  (=> (dynamic_invariant3 index true false true true)
  (=> (= output nil)
  (let ((temp___346 (first3 stream)))
  (forall ((j Int))
  (=> (= j temp___346)
  (=>
  (= (and (ite (<= temp___346 j) true false) (ite (<= j (last3 stream)) true
                                             false)) true)
  (forall ((index1 Int) (j1 Int))
  (=>
  (= (and (ite (dynamic_invariant3 index1 true true true true) true false) 
  (ite (and (<= (first3 stream) j1) (<= j1 (last3 stream))) true false)) true)
  (forall ((spark__branch Bool))
  (=> (= spark__branch (ite (<= (+ index1 3) 48) true false))
  (=> (= spark__branch true)
  (=> (= index1 r19b)
  (=> (dynamic_invariant3 r19b true false true true)
  (=> (= (+ index1 2) r20b)
  (=> (dynamic_invariant r20b true false true true)
  (forall ((o (_ BitVec 8)))
  (=> (= (to_rep3 (select (to_array1 stream) j1)) o)
  (forall ((temp___351 Int))
  (=> (= (to_rep (select hex (bv2nat (bvurem o #x10)))) temp___351)
  (forall ((o1 (_ BitVec 8)))
  (=> (= (to_rep3 (select (to_array1 stream) j1)) o1)
  (forall ((temp___349 Int))
  (=> (= (to_rep (select hex (bv2nat (bvudiv o1 #x10)))) temp___349)
  (in_range1 (- (+ 1 (+ 1 1)) 1)))))))))))))))))))))))))))))))))
(check-sat)
(exit)
