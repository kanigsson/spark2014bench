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

(declare-fun nth ((_ BitVec 32) Int) Bool)

(declare-fun lsr ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun asr ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun lsl ((_ BitVec 32) Int) (_ BitVec 32))

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

(declare-fun rotate_right1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun rotate_left1 ((_ BitVec 32) Int) (_ BitVec 32))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 32))) Int (ite (bvsge x (_ bv0 32))
                                            (bv2nat x)
                                            (- (- 4294967296 (bv2nat x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 4294967295)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvshl x n) (lsl x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
  (assert
  (forall ((v (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvor (bvshl v (bvurem n (_ bv32 32))) (bvlshr v (bvsub (_ bv32 32) (bvurem n (_ bv32 32))))) 
  (rotate_left1 v (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
  (assert
  (forall ((v (_ BitVec 32)) (n (_ BitVec 32)))
  (= (bvor (bvlshr v (bvurem n (_ bv32 32))) (bvshl v (bvsub (_ bv32 32) (bvurem n (_ bv32 32))))) 
  (rotate_right1 v (bv2nat n)))))

(declare-fun nth_bv ((_ BitVec 32) (_ BitVec 32)) Bool)

;; nth_bv_def
  (assert
  (forall ((x (_ BitVec 32)) (i (_ BitVec 32)))
  (= (= (nth_bv x i) true)
  (not (= (bvand (bvlshr x i) #x00000001) #x00000000)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x (_ BitVec 32)) (i (_ BitVec 32)))
  (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x (_ BitVec 32)) (i Int))
  (=> (and (<= 0 i) (< i 4294967296))
  (= (nth_bv x ((_ int2bv 32) i)) (nth x i)))))

(declare-fun eq_sub_bv ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)
  (_ BitVec 32)) Bool)

;; eq_sub_bv_def
  (assert
  (forall ((a (_ BitVec 32)) (b (_ BitVec 32)) (i (_ BitVec 32))
  (n (_ BitVec 32)))
  (let ((mask (bvshl (bvsub (bvshl #x00000001 n) #x00000001) i)))
  (= (eq_sub_bv a b i n) (= (bvand b mask) (bvand a mask))))))

(define-fun eq_sub ((a (_ BitVec 32)) (b (_ BitVec 32)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

;; eq_sub_equiv
  (assert
  (forall ((a (_ BitVec 32)) (b (_ BitVec 32)) (i (_ BitVec 32))
  (n (_ BitVec 32)))
  (= (eq_sub a b (bv2nat i) (bv2nat n)) (eq_sub_bv a b i n))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content (_ BitVec 32))))))
(declare-fun power ((_ BitVec 32) Int) (_ BitVec 32))

(define-fun bv_min ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 32))
  (y (_ BitVec 32))) (_ BitVec 32) (ite (bvule x y) y x))

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

(declare-sort address_type 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 32))

(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 32)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 32))

(declare-fun user_eq1 (address_type address_type) Bool)

(declare-const dummy1 address_type)

(declare-datatypes ((address_type__ref 0))
(((address_type__refqtmk (address_type__content address_type)))))
(define-fun address_type__ref_address_type__content__projection ((a address_type__ref)) address_type 
  (address_type__content a))

(declare-fun to_rep1 (address_type) (_ BitVec 32))

(declare-fun of_rep1 ((_ BitVec 32)) address_type)

;; inversion_axiom
  (assert
  (forall ((x address_type))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 32)))
  (! (= (to_rep1 (of_rep1 x)) x) :pattern ((to_rep1 (of_rep1 x))) )))

(define-fun to_int2 ((x address_type)) Int (bv2nat (to_rep1 x)))

;; range_int_axiom
  (assert
  (forall ((x address_type)) (! (uint_in_range
  (to_int2 x)) :pattern ((to_int2 x)) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__repro__area__from address_type)(rec__repro__area__to address_type)))))
(define-fun us_split_fields_rec__repro__area__from__projection ((a us_split_fields)) address_type 
  (rec__repro__area__from a))

(define-fun us_split_fields_rec__repro__area__to__projection ((a us_split_fields)) address_type 
  (rec__repro__area__to a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1
                           (rec__repro__area__from (us_split_fields1 a))) 
                        (to_rep1
                        (rec__repro__area__from (us_split_fields1 b))))
                        (= (to_rep1
                           (rec__repro__area__to (us_split_fields1 a))) 
                        (to_rep1 (rec__repro__area__to (us_split_fields1 b)))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const repro__area__from__first__bit Int)

(declare-const repro__area__from__last__bit Int)

(declare-const repro__area__from__position Int)

;; repro__area__from__first__bit_axiom
  (assert (<= 0 repro__area__from__first__bit))

;; repro__area__from__last__bit_axiom
  (assert (< repro__area__from__first__bit repro__area__from__last__bit))

;; repro__area__from__position_axiom
  (assert (<= 0 repro__area__from__position))

(declare-const repro__area__to__first__bit Int)

(declare-const repro__area__to__last__bit Int)

(declare-const repro__area__to__position Int)

;; repro__area__to__first__bit_axiom
  (assert (<= 0 repro__area__to__first__bit))

;; repro__area__to__last__bit_axiom
  (assert (< repro__area__to__first__bit repro__area__to__last__bit))

;; repro__area__to__position_axiom
  (assert (<= 0 repro__area__to__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((area__ref 0))
(((area__refqtmk (area__content us_rep)))))
(define-fun area__ref_area__content__projection ((a area__ref)) us_rep 
  (area__content a))

(declare-const full_area us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort size_t 0)

(declare-fun size_tqtint (size_t) Int)

;; size_t'axiom
  (assert
  (forall ((i size_t)) (and (<= 0 (size_tqtint i)) (<= (size_tqtint i) 5))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (size_t size_t) Bool)

(declare-const dummy3 size_t)

(declare-datatypes ((size_t__ref 0))
(((size_t__refqtmk (size_t__content size_t)))))
(define-fun size_t__ref_size_t__content__projection ((a size_t__ref)) size_t 
  (size_t__content a))

(define-fun to_rep2 ((x size_t)) Int (size_tqtint x))

(declare-fun of_rep2 (Int) size_t)

;; inversion_axiom
  (assert
  (forall ((x size_t))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x size_t)) (! (in_range2 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int us_rep))))))
(declare-fun slide ((Array Int us_rep) Int Int) (Array Int us_rep))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int us_rep)) (a__first Int) (a__last Int)
  (b (Array Int us_rep)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (bool_eq (select a temp___idx_154)
                              (select b (+ (- b__first a__first) temp___idx_154))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep)) (b (Array Int us_rep)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (bool_eq (select a temp___idx_154)
     (select b (+ (- b__first a__first) temp___idx_154))) true))))))))

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
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int us_rep))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int us_rep) (elts a))

(define-fun of_array ((a (Array Int us_rep)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                   (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment1))

(define-fun bool_eq2 ((x us_t)
  (y us_t)) Bool (bool_eq1 (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ((area_array__ref 0))
(((area_array__refqtmk (area_array__content us_t)))))
(define-fun area_array__ref_area_array__content__projection ((a area_array__ref)) us_t 
  (area_array__content a))

(declare-datatypes ((t4b__ref 0))
(((t4b__refqtmk (t4b__content us_t)))))
(define-fun t4b__ref_t4b__content__projection ((a t4b__ref)) us_t (t4b__content
                                                                  a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__repro__ensemble__size size_t)))))
(define-fun us_split_discrs_rec__repro__ensemble__size__projection ((a us_split_discrs)) size_t 
  (rec__repro__ensemble__size a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__repro__ensemble__areas us_t)))))
(define-fun us_split_fields_rec__repro__ensemble__areas__projection ((a us_split_fields2)) us_t 
  (rec__repro__ensemble__areas a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs1 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep2
                            (rec__repro__ensemble__size (us_split_discrs1 a))) 
                         (to_rep2
                         (rec__repro__ensemble__size (us_split_discrs1 b))))
                         (= (bool_eq2
                            (rec__repro__ensemble__areas
                            (us_split_fields3 a))
                            (rec__repro__ensemble__areas
                            (us_split_fields3 b))) true))
                    true false))

(define-fun in_range3 ((rec__repro__ensemble__size1 Int)
  (a us_split_discrs)) Bool (= rec__repro__ensemble__size1 (to_rep2
                                                           (rec__repro__ensemble__size
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

(declare-const repro__ensemble__size__first__bit Int)

(declare-const repro__ensemble__size__last__bit Int)

(declare-const repro__ensemble__size__position Int)

;; repro__ensemble__size__first__bit_axiom
  (assert (<= 0 repro__ensemble__size__first__bit))

;; repro__ensemble__size__last__bit_axiom
  (assert
  (< repro__ensemble__size__first__bit repro__ensemble__size__last__bit))

;; repro__ensemble__size__position_axiom
  (assert (<= 0 repro__ensemble__size__position))

(declare-const repro__ensemble__areas__first__bit Int)

(declare-const repro__ensemble__areas__last__bit Int)

(declare-const repro__ensemble__areas__position Int)

;; repro__ensemble__areas__first__bit_axiom
  (assert (<= 0 repro__ensemble__areas__first__bit))

;; repro__ensemble__areas__last__bit_axiom
  (assert
  (< repro__ensemble__areas__first__bit repro__ensemble__areas__last__bit))

;; repro__ensemble__areas__position_axiom
  (assert (<= 0 repro__ensemble__areas__position))

(declare-fun user_eq5 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ((ensemble__ref 0))
(((ensemble__refqtmk (ensemble__content us_rep1)))))
(define-fun ensemble__ref_ensemble__content__projection ((a ensemble__ref)) us_rep1 
  (ensemble__content a))

(declare-const e us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const result_arr__first integer)

(declare-const result_arr__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const save_result_arr__first integer)

(declare-const save_result_arr__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(define-fun dynamic_invariant ((temp___expr_182 Int)
  (temp___is_init_178 Bool) (temp___skip_constant_179 Bool)
  (temp___do_toplevel_180 Bool)
  (temp___do_typ_inv_181 Bool)) Bool (=>
                                     (or (= temp___is_init_178 true)
                                     (<= 0 5)) (in_range2 temp___expr_182)))

(define-fun dynamic_invariant1 ((temp___expr_218 us_rep1)
  (temp___is_init_214 Bool) (temp___skip_constant_215 Bool)
  (temp___do_toplevel_216 Bool)
  (temp___do_typ_inv_217 Bool)) Bool (let ((temp___219 (rec__repro__ensemble__size
                                                       (us_split_discrs1
                                                       temp___expr_218))))
                                     (and (dynamic_property 1
                                     (to_rep2 temp___219)
                                     (first1
                                     (rec__repro__ensemble__areas
                                     (us_split_fields3 temp___expr_218)))
                                     (last1
                                     (rec__repro__ensemble__areas
                                     (us_split_fields3 temp___expr_218))))
                                     (and
                                     (= (first1
                                        (rec__repro__ensemble__areas
                                        (us_split_fields3 temp___expr_218))) 1)
                                     (= (last1
                                        (rec__repro__ensemble__areas
                                        (us_split_fields3 temp___expr_218))) 
                                     (to_rep2 temp___219))))))

(declare-datatypes ((tresult_arrS__ref 0))
(((tresult_arrS__refqtmk (tresult_arrS__content us_t)))))
(define-fun tresult_arrS__ref_tresult_arrS__content__projection ((a tresult_arrS__ref)) us_t 
  (tresult_arrS__content a))

(declare-datatypes ((t9b__ref 0))
(((t9b__refqtmk (t9b__content us_t)))))
(define-fun t9b__ref_t9b__content__projection ((a t9b__ref)) us_t (t9b__content
                                                                  a))

(declare-datatypes ((tsave_result_arrS__ref 0))
(((tsave_result_arrS__refqtmk (tsave_result_arrS__content us_t)))))
(define-fun tsave_result_arrS__ref_tsave_result_arrS__content__projection ((a tsave_result_arrS__ref)) us_t 
  (tsave_result_arrS__content a))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq6 (integer integer) Bool)

(declare-const dummy6 integer)

(declare-datatypes ((t10b__ref 0))
(((t10b__refqtmk (t10b__content integer)))))
(define-fun t10b__ref_t10b__content__projection ((a t10b__ref)) integer 
  (t10b__content a))

(define-fun dynamic_invariant2 ((temp___expr_252 us_t)
  (temp___is_init_248 Bool) (temp___skip_constant_249 Bool)
  (temp___do_toplevel_250 Bool)
  (temp___do_typ_inv_251 Bool)) Bool (=>
                                     (not (= temp___skip_constant_249 true))
                                     (and (dynamic_property 1
                                     (+ (to_rep2
                                        (rec__repro__ensemble__size
                                        (us_split_discrs1 e))) 1)
                                     (first1 temp___expr_252)
                                     (last1 temp___expr_252))
                                     (and (= (first1 temp___expr_252) 1)
                                     (= (last1 temp___expr_252) (+ (to_rep2
                                                                   (rec__repro__ensemble__size
                                                                   (us_split_discrs1
                                                                   e))) 1))))))

(define-fun default_initial_assumption ((temp___expr_254 us_t)
  (temp___skip_top_level_255 Bool)) Bool (and (= (first1 temp___expr_254) 1)
                                         (= (last1 temp___expr_254) (+ 
                                         (to_rep2
                                         (rec__repro__ensemble__size
                                         (us_split_discrs1 e))) 1))))

(declare-fun repro__local__result_arr__aggregate_def (us_rep Int Int) us_t)

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant4 ((temp___expr_196 (_ BitVec 32))
  (temp___is_init_192 Bool) (temp___skip_constant_193 Bool)
  (temp___do_toplevel_194 Bool) (temp___do_typ_inv_195 Bool)) Bool true)

;; full_area__def_axiom
  (assert
  (= full_area (us_repqtmk
               (us_split_fieldsqtmk (of_rep1 #x00000000)
               (of_rep1 #xFFFFFFFF)))))

(define-fun dynamic_invariant5 ((temp___expr_212 us_t)
  (temp___is_init_208 Bool) (temp___skip_constant_209 Bool)
  (temp___do_toplevel_210 Bool)
  (temp___do_typ_inv_211 Bool)) Bool (=>
                                     (not (= temp___skip_constant_209 true))
                                     (dynamic_property 0 5
                                     (first1 temp___expr_212)
                                     (last1 temp___expr_212))))

;; def_axiom
  (assert
  (forall ((temp___264 us_rep))
  (forall ((temp___265 Int) (temp___266 Int))
  (let ((temp___263 (repro__local__result_arr__aggregate_def temp___264
                    temp___265 temp___266)))
  (and
  (=> (dynamic_property 0 5 temp___265 temp___266)
  (and (= (first1 temp___263) temp___265) (= (last1 temp___263) temp___266)))
  (forall ((temp___267 Int))
  (= (select (to_array temp___263) temp___267) temp___264)))))))

(define-fun dynamic_invariant6 ((temp___expr_240 us_t)
  (temp___is_init_236 Bool) (temp___skip_constant_237 Bool)
  (temp___do_toplevel_238 Bool)
  (temp___do_typ_inv_239 Bool)) Bool (=>
                                     (not (= temp___skip_constant_237 true))
                                     (and (dynamic_property 1
                                     (+ (to_rep2
                                        (rec__repro__ensemble__size
                                        (us_split_discrs1 e))) 1)
                                     (first1 temp___expr_240)
                                     (last1 temp___expr_240))
                                     (and (= (first1 temp___expr_240) 1)
                                     (= (last1 temp___expr_240) (+ (to_rep2
                                                                   (rec__repro__ensemble__size
                                                                   (us_split_discrs1
                                                                   e))) 1))))))

(define-fun default_initial_assumption1 ((temp___expr_242 us_t)
  (temp___skip_top_level_243 Bool)) Bool (and (= (first1 temp___expr_242) 1)
                                         (= (last1 temp___expr_242) (+ 
                                         (to_rep2
                                         (rec__repro__ensemble__size
                                         (us_split_discrs1 e))) 1))))

(assert
;; defqtvc
 ;; File "repro.adb", line 22, characters 0-0
  (not
  (forall ((save_result_arr (Array Int us_rep)) (o address_type)
  (o1 address_type) (o2 Int))
  (=> (= (to_rep1 o) #xFFFFFFFF)
  (=> (= (to_rep1 o1) #x00000000)
  (=> (= (us_repqtmk (us_split_fieldsqtmk o1 o)) full_area)
  (=> (dynamic_invariant1 e true false true true)
  (=> (< (to_rep2 (rec__repro__ensemble__size (us_split_discrs1 e))) 5)
  (=> (= (to_rep2 (rec__repro__ensemble__size (us_split_discrs1 e))) o2)
  (let ((temp___268 (repro__local__result_arr__aggregate_def full_area 1
                    (+ o2 1))))
  (=> (= (first1 temp___268) 1)
  (=>
  (= (last1 temp___268) (+ (to_rep2
                           (rec__repro__ensemble__size (us_split_discrs1 e))) 1))
  (=>
  (ite (<= (first1 temp___268) (last1 temp___268))
  (and
  (<= 1 (+ (to_rep2 (rec__repro__ensemble__size (us_split_discrs1 e))) 1))
  (= (- (last1 temp___268) (first1 temp___268)) (- (+ (to_rep2
                                                      (rec__repro__ensemble__size
                                                      (us_split_discrs1 e))) 1) 1)))
  (< (+ (to_rep2 (rec__repro__ensemble__size (us_split_discrs1 e))) 1) 1))
  (let ((repro__local__result_arr__assume (of_array (to_array temp___268)
                                          (first1 temp___268)
                                          (last1 temp___268))))
  (forall ((result_arr (Array Int us_rep)))
  (=> (= result_arr (to_array repro__local__result_arr__assume))
  (=>
  (= (to_rep result_arr__first) (first1 repro__local__result_arr__assume))
  (=> (= (to_rep result_arr__last) (last1 repro__local__result_arr__assume))
  (=>
  (and (dynamic_property 1
  (+ (to_rep2 (rec__repro__ensemble__size (us_split_discrs1 e))) 1)
  (to_rep result_arr__first) (to_rep result_arr__last))
  (and (= (to_rep result_arr__first) 1)
  (= (to_rep result_arr__last) (+ (to_rep2
                                  (rec__repro__ensemble__size
                                  (us_split_discrs1 e))) 1))))
  (forall ((result_pos Int))
  (=> (= result_pos 0)
  (=> (dynamic_invariant result_pos true false true true)
  (=> (default_initial_assumption
  (of_array save_result_arr (to_rep save_result_arr__first)
  (to_rep save_result_arr__last)) false)
  (=>
  (and (dynamic_property 1
  (+ (to_rep2 (rec__repro__ensemble__size (us_split_discrs1 e))) 1)
  (to_rep save_result_arr__first) (to_rep save_result_arr__last))
  (and (= (to_rep save_result_arr__first) 1)
  (= (to_rep save_result_arr__last) (+ (to_rep2
                                       (rec__repro__ensemble__size
                                       (us_split_discrs1 e))) 1))))
  (forall ((o3 Int))
  (=> (= (to_rep2 (rec__repro__ensemble__size (us_split_discrs1 e))) o3)
  (forall ((e_pos Int))
  (=> (= e_pos 1)
  (=>
  (= (and (ite (<= 1 e_pos) true false) (ite (<= e_pos (- o3 1)) true false)) true)
  (=>
  (ite (<= (to_rep result_arr__first) (to_rep result_arr__last))
  (and
  (<= 1 (+ (to_rep2 (rec__repro__ensemble__size (us_split_discrs1 e))) 1))
  (= (- (to_rep result_arr__last) (to_rep result_arr__first)) (- (+ (to_rep2
                                                                    (rec__repro__ensemble__size
                                                                    (us_split_discrs1
                                                                    e))) 1) 1)))
  (< (+ (to_rep2 (rec__repro__ensemble__size (us_split_discrs1 e))) 1) 1))
  (forall ((o4 Int))
  (=> (= (to_rep result_arr__last) o4)
  (forall ((o5 Int))
  (=> (= (to_rep result_arr__first) o5)
  (let ((temp___276 (of_array result_arr o5 o4)))
  (=>
  (ite (<= (first1 temp___276) (last1 temp___276))
  (and (<= (to_rep save_result_arr__first) (to_rep save_result_arr__last))
  (= (- (last1 temp___276) (first1 temp___276)) (- (to_rep
                                                   save_result_arr__last) 
  (to_rep save_result_arr__first))))
  (< (to_rep save_result_arr__last) (to_rep save_result_arr__first)))
  (forall ((save_result_arr1 (Array Int us_rep)))
  (=> (= save_result_arr1 (to_array temp___276))
  (let ((o6 (+ result_pos 1)))
  (=> (in_range2 o6)
  (forall ((result_pos1 Int))
  (=> (= result_pos1 o6) (in_range1 (+ e_pos 1))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
