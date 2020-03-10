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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const y Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const z Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun nth ((_ BitVec 16) Int) Bool)

(declare-fun lsr ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun asr ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun lsl ((_ BitVec 16) Int) (_ BitVec 16))

(define-fun abs1 ((x1 Int)) Int (ite (<= 0 x1) x1 (- x1)))

;; Abs_le
  (assert
  (forall ((x1 Int) (y1 Int))
  (= (<= (abs1 x1) y1) (and (<= (- y1) x1) (<= x1 y1)))))

;; Abs_pos
  (assert (forall ((x1 Int)) (<= 0 (abs1 x1))))

;; Div_unique
  (assert
  (forall ((x1 Int) (y1 Int) (q Int))
  (=> (< 0 y1)
  (=> (and (<= (* q y1) x1) (< x1 (+ (* q y1) y1))) (= (div x1 y1) q)))))

;; Div_bound
  (assert
  (forall ((x1 Int) (y1 Int))
  (=> (and (<= 0 x1) (< 0 y1)) (and (<= 0 (div x1 y1)) (<= (div x1 y1) x1)))))

;; Div_inf
  (assert
  (forall ((x1 Int) (y1 Int))
  (=> (and (<= 0 x1) (< x1 y1)) (= (div x1 y1) 0))))

;; Div_inf_neg
  (assert
  (forall ((x1 Int) (y1 Int))
  (=> (and (< 0 x1) (<= x1 y1)) (= (div (- x1) y1) (- 1)))))

;; Mod_0
  (assert (forall ((y1 Int)) (=> (not (= y1 0)) (= (mod 0 y1) 0))))

;; Div_1_left
  (assert (forall ((y1 Int)) (=> (< 1 y1) (= (div 1 y1) 0))))

;; Div_minus1_left
  (assert (forall ((y1 Int)) (=> (< 1 y1) (= (div (- 1) y1) (- 1)))))

;; Mod_1_left
  (assert (forall ((y1 Int)) (=> (< 1 y1) (= (mod 1 y1) 1))))

;; Mod_minus1_left
  (assert
  (forall ((y1 Int))
  (! (=> (< 1 y1) (= (mod (- 1) y1) (- y1 1))) :pattern ((mod (- 1) y1)) )))

;; Div_mult
  (assert
  (forall ((x1 Int) (y1 Int) (z1 Int))
  (! (=> (< 0 x1) (= (div (+ (* x1 y1) z1) x1) (+ y1 (div z1 x1)))) :pattern ((div (+ (* x1 y1) z1) x1)) )))

;; Mod_mult
  (assert
  (forall ((x1 Int) (y1 Int) (z1 Int))
  (! (=> (< 0 x1) (= (mod (+ (* x1 y1) z1) x1) (mod z1 x1))) :pattern ((mod (+ (* x1 y1) z1) x1)) )))

(declare-fun rotate_right1 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun rotate_left1 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x1 (_ BitVec 16))) Int (ite (bvsge x1 (_ bv0 16))
                                             (bv2nat x1)
                                             (- (- 65536 (bv2nat x1)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 65535)))

;; lsr_bv_is_lsr
  (assert
  (forall ((x1 (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvlshr x1 n) (lsr x1 (bv2nat n)))))

;; asr_bv_is_asr
  (assert
  (forall ((x1 (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvashr x1 n) (asr x1 (bv2nat n)))))

;; lsl_bv_is_lsl
  (assert
  (forall ((x1 (_ BitVec 16)) (n (_ BitVec 16)))
  (= (bvshl x1 n) (lsl x1 (bv2nat n)))))

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
  (forall ((x1 (_ BitVec 16)) (i (_ BitVec 16)))
  (= (= (nth_bv x1 i) true) (not (= (bvand (bvlshr x1 i) #x0001) #x0000)))))

;; Nth_bv_is_nth
  (assert
  (forall ((x1 (_ BitVec 16)) (i (_ BitVec 16)))
  (= (nth x1 (bv2nat i)) (nth_bv x1 i))))

;; Nth_bv_is_nth2
  (assert
  (forall ((x1 (_ BitVec 16)) (i Int))
  (=> (and (<= 0 i) (< i 65536))
  (= (nth_bv x1 ((_ int2bv 16) i)) (nth x1 i)))))

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

(define-fun bv_min ((x1 (_ BitVec 16))
  (y1 (_ BitVec 16))) (_ BitVec 16) (ite (bvule x1 y1) x1 y1))

(define-fun bv_max ((x1 (_ BitVec 16))
  (y1 (_ BitVec 16))) (_ BitVec 16) (ite (bvule x1 y1) y1 x1))

(define-fun min ((x1 Int) (y1 Int)) Int (ite (<= x1 y1) x1 y1))

(define-fun max ((x1 Int) (y1 Int)) Int (ite (<= x1 y1) y1 x1))

;; Min_r
  (assert (forall ((x1 Int) (y1 Int)) (=> (<= y1 x1) (= (min x1 y1) y1))))

;; Max_l
  (assert (forall ((x1 Int) (y1 Int)) (=> (<= y1 x1) (= (max x1 y1) x1))))

;; Min_comm
  (assert (forall ((x1 Int) (y1 Int)) (= (min x1 y1) (min y1 x1))))

;; Max_comm
  (assert (forall ((x1 Int) (y1 Int)) (= (max x1 y1) (max y1 x1))))

;; Min_assoc
  (assert
  (forall ((x1 Int) (y1 Int) (z1 Int))
  (= (min (min x1 y1) z1) (min x1 (min y1 z1)))))

;; Max_assoc
  (assert
  (forall ((x1 Int) (y1 Int) (z1 Int))
  (= (max (max x1 y1) z1) (max x1 (max y1 z1)))))

(declare-sort ar_index 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 16))

(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 16)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 16))

(declare-fun user_eq1 (ar_index ar_index) Bool)

(declare-const dummy1 ar_index)

(declare-datatypes ((ar_index__ref 0))
(((ar_index__refqtmk (ar_index__content ar_index)))))
(define-fun ar_index__ref_ar_index__content__projection ((a ar_index__ref)) ar_index 
  (ar_index__content a))

(declare-fun to_rep (ar_index) (_ BitVec 16))

(declare-fun of_rep ((_ BitVec 16)) ar_index)

;; inversion_axiom
  (assert
  (forall ((x1 ar_index))
  (! (= (of_rep (to_rep x1)) x1) :pattern ((to_rep x1)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x1 (_ BitVec 16)))
  (! (= (to_rep (of_rep x1)) x1) :pattern ((to_rep (of_rep x1))) )))

(define-fun to_int2 ((x1 ar_index)) Int (bv2nat (to_rep x1)))

;; range_int_axiom
  (assert
  (forall ((x1 ar_index)) (! (uint_in_range
  (to_int2 x1)) :pattern ((to_int2 x1)) )))

(define-fun to_rep1 ((x1 integer)) Int (integerqtint x1))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x1 integer))
  (! (= (of_rep1 (to_rep1 x1)) x1) :pattern ((to_rep1 x1)) )))

;; range_axiom
  (assert
  (forall ((x1 integer)) (! (in_range
  (to_rep1 x1)) :pattern ((to_rep1 x1)) )))

;; coerce_axiom
  (assert
  (forall ((x1 Int))
  (! (=> (in_range x1) (= (to_rep1 (of_rep1 x1)) x1)) :pattern ((to_rep1
                                                                (of_rep1 x1))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array (_ BitVec 16) integer))))))
(declare-fun slide ((Array (_ BitVec 16) integer) (_ BitVec 16)
  (_ BitVec 16)) (Array (_ BitVec 16) integer))

;; slide_eq
  (assert
  (forall ((a (Array (_ BitVec 16) integer)))
  (forall ((first (_ BitVec 16)))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array (_ BitVec 16) integer)))
  (forall ((old_first (_ BitVec 16)))
  (forall ((new_first (_ BitVec 16)))
  (forall ((i (_ BitVec 16)))
  (! (= (select (slide a old_first new_first) i) (select a (bvsub i (bvsub new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array (_ BitVec 16) integer))
  (a__first (_ BitVec 16)) (a__last (_ BitVec 16))
  (b (Array (_ BitVec 16) integer)) (b__first (_ BitVec 16))
  (b__last (_ BitVec 16))) Bool (ite (and
                                     (ite (bvule a__first a__last)
                                     (and (bvule b__first b__last)
                                     (= (bvsub a__last a__first) (bvsub b__last b__first)))
                                     (bvugt b__first b__last))
                                     (forall ((temp___idx_154 (_ BitVec 16)))
                                     (=>
                                     (and (bvule a__first temp___idx_154)
                                     (bvule temp___idx_154 a__last))
                                     (= (to_rep1 (select a temp___idx_154)) 
                                     (to_rep1
                                     (select b (bvadd (bvsub b__first a__first) temp___idx_154)))))))
                                true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array (_ BitVec 16) integer))
  (b (Array (_ BitVec 16) integer)))
  (forall ((a__first (_ BitVec 16)) (a__last (_ BitVec 16))
  (b__first (_ BitVec 16)) (b__last (_ BitVec 16)))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (bvule a__first a__last)
  (and (bvule b__first b__last)
  (= (bvsub a__last a__first) (bvsub b__last b__first)))
  (bvugt b__first b__last))
  (forall ((temp___idx_154 (_ BitVec 16)))
  (=> (and (bvule a__first temp___idx_154) (bvule temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (bvadd (bvsub b__first a__first) temp___idx_154)))))))))))

(declare-const dummy2 (Array (_ BitVec 16) integer))

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

(declare-fun user_eq2 ((Array (_ BitVec 16) integer)
  (Array (_ BitVec 16) integer)) Bool)

(declare-sort length_type 0)

(declare-fun length_typeqtint (length_type) Int)

;; length_type'axiom
  (assert
  (forall ((i length_type))
  (and (<= 0 (length_typeqtint i)) (<= (length_typeqtint i) 65536))))

(define-fun in_range1 ((x1 Int)) Bool (and (<= 0 x1) (<= x1 65536)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq3 (length_type length_type) Bool)

(declare-const dummy3 length_type)

(declare-datatypes ((length_type__ref 0))
(((length_type__refqtmk (length_type__content length_type)))))
(define-fun length_type__ref_length_type__content__projection ((a length_type__ref)) length_type 
  (length_type__content a))

(define-fun to_rep2 ((x1 length_type)) Int (length_typeqtint x1))

(declare-fun of_rep2 (Int) length_type)

;; inversion_axiom
  (assert
  (forall ((x1 length_type))
  (! (= (of_rep2 (to_rep2 x1)) x1) :pattern ((to_rep2 x1)) )))

;; range_axiom
  (assert
  (forall ((x1 length_type)) (! (in_range1
  (to_rep2 x1)) :pattern ((to_rep2 x1)) )))

;; coerce_axiom
  (assert
  (forall ((x1 Int))
  (! (=> (in_range1 x1) (= (to_rep2 (of_rep2 x1)) x1)) :pattern ((to_rep2
                                                                 (of_rep2 x1))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__ring_buf__ring_buffer__data (Array (_ BitVec 16) integer))(rec__ring_buf__ring_buffer__first ar_index)(rec__ring_buf__ring_buffer__length length_type)))))
(define-fun us_split_fields_rec__ring_buf__ring_buffer__data__projection ((a us_split_fields)) (Array (_ BitVec 16) integer) 
  (rec__ring_buf__ring_buffer__data a))

(define-fun us_split_fields_rec__ring_buf__ring_buffer__first__projection ((a us_split_fields)) ar_index 
  (rec__ring_buf__ring_buffer__first a))

(define-fun us_split_fields_rec__ring_buf__ring_buffer__length__projection ((a us_split_fields)) length_type 
  (rec__ring_buf__ring_buffer__length a))

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
                        (and
                        (= (bool_eq
                           (rec__ring_buf__ring_buffer__data
                           (us_split_fields1 a)) #x0000 #xFFFF
                           (rec__ring_buf__ring_buffer__data
                           (us_split_fields1 b)) #x0000 #xFFFF) true)
                        (= (to_rep
                           (rec__ring_buf__ring_buffer__first
                           (us_split_fields1 a))) (to_rep
                                                  (rec__ring_buf__ring_buffer__first
                                                  (us_split_fields1 b)))))
                        (= (to_rep2
                           (rec__ring_buf__ring_buffer__length
                           (us_split_fields1 a))) (to_rep2
                                                  (rec__ring_buf__ring_buffer__length
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

(declare-const ring_buf__ring_buffer__data__first__bit Int)

(declare-const ring_buf__ring_buffer__data__last__bit Int)

(declare-const ring_buf__ring_buffer__data__position Int)

;; ring_buf__ring_buffer__data__first__bit_axiom
  (assert (<= 0 ring_buf__ring_buffer__data__first__bit))

;; ring_buf__ring_buffer__data__last__bit_axiom
  (assert
  (< ring_buf__ring_buffer__data__first__bit ring_buf__ring_buffer__data__last__bit))

;; ring_buf__ring_buffer__data__position_axiom
  (assert (<= 0 ring_buf__ring_buffer__data__position))

(declare-const ring_buf__ring_buffer__first__first__bit Int)

(declare-const ring_buf__ring_buffer__first__last__bit Int)

(declare-const ring_buf__ring_buffer__first__position Int)

;; ring_buf__ring_buffer__first__first__bit_axiom
  (assert (<= 0 ring_buf__ring_buffer__first__first__bit))

;; ring_buf__ring_buffer__first__last__bit_axiom
  (assert
  (< ring_buf__ring_buffer__first__first__bit ring_buf__ring_buffer__first__last__bit))

;; ring_buf__ring_buffer__first__position_axiom
  (assert (<= 0 ring_buf__ring_buffer__first__position))

(declare-const ring_buf__ring_buffer__length__first__bit Int)

(declare-const ring_buf__ring_buffer__length__last__bit Int)

(declare-const ring_buf__ring_buffer__length__position Int)

;; ring_buf__ring_buffer__length__first__bit_axiom
  (assert (<= 0 ring_buf__ring_buffer__length__first__bit))

;; ring_buf__ring_buffer__length__last__bit_axiom
  (assert
  (< ring_buf__ring_buffer__length__first__bit ring_buf__ring_buffer__length__last__bit))

;; ring_buf__ring_buffer__length__position_axiom
  (assert (<= 0 ring_buf__ring_buffer__length__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((ring_buffer__ref 0))
(((ring_buffer__refqtmk (ring_buffer__content us_rep)))))
(define-fun ring_buffer__ref_ring_buffer__content__projection ((a ring_buffer__ref)) us_rep 
  (ring_buffer__content a))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort t 0)

(declare-fun first (t) ar_index)

(declare-fun last (t) ar_index)

(declare-fun mk ((_ BitVec 16) (_ BitVec 16)) t)

;; mk_def
  (assert
  (forall ((f (_ BitVec 16)) (l (_ BitVec 16)))
  (! (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first (_ BitVec 16))
  (range_last (_ BitVec 16)) (low (_ BitVec 16))
  (high (_ BitVec 16))) Bool true)

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array (_ BitVec 16) integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array (_ BitVec 16) integer) (elts a))

(define-fun of_array ((a (Array (_ BitVec 16) integer)) (f (_ BitVec 16))
  (l (_ BitVec 16))) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) (_ BitVec 16) (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) (_ BitVec 16) (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (bvule (first1 a) (last1 a))
                                  (+ (- (bv2nat (last1 a)) (bv2nat (first1 a))) 1)
                                  0))

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

(define-fun bool_eq2 ((x1 us_t)
  (y1 us_t)) Bool (bool_eq (elts x1) (to_rep (first (rt x1)))
                  (to_rep (last (rt x1))) (elts y1) (to_rep (first (rt y1)))
                  (to_rep (last (rt y1)))))

(declare-fun user_eq5 (us_t us_t) Bool)

(declare-const dummy5 us_t)

(declare-datatypes ((model__ref 0))
(((model__refqtmk (model__content us_t)))))
(define-fun model__ref_model__content__projection ((a model__ref)) us_t 
  (model__content a))

(declare-fun to_model (us_rep) us_t)

(declare-fun to_model__function_guard (us_t us_rep) Bool)

(declare-fun temp_____aggregate_def_233 (Int) (Array (_ BitVec 16) integer))

(declare-fun is_full (us_rep) Bool)

(declare-fun is_full__function_guard (Bool us_rep) Bool)

(declare-fun func_push (us_t Int) us_t)

(declare-fun func_push__function_guard (us_t us_t Int) Bool)

(declare-fun is_empty (us_rep) Bool)

(declare-fun is_empty__function_guard (Bool us_rep) Bool)

(declare-fun func_pop (us_t) us_t)

(declare-fun func_pop__function_guard (us_t us_t) Bool)

(declare-fun func_head (us_t) Int)

(declare-fun func_head__function_guard (Int us_t) Bool)

(define-fun dynamic_invariant1 ((temp___expr_165 (_ BitVec 16))
  (temp___is_init_161 Bool) (temp___skip_constant_162 Bool)
  (temp___do_toplevel_163 Bool) (temp___do_typ_inv_164 Bool)) Bool true)

(define-fun dynamic_invariant2 ((temp___expr_188 Int)
  (temp___is_init_184 Bool) (temp___skip_constant_185 Bool)
  (temp___do_toplevel_186 Bool)
  (temp___do_typ_inv_187 Bool)) Bool (=>
                                     (or (= temp___is_init_184 true)
                                     (<= 0 65536)) (in_range1
                                     temp___expr_188)))

(define-fun dynamic_invariant3 ((temp___expr_172 us_t)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (=>
                                     (not (= temp___skip_constant_169 true))
                                     (dynamic_property #x0000 #xFFFF
                                     (first1 temp___expr_172)
                                     (last1 temp___expr_172))))

(define-fun length1 ((x1 Int)
  (y1 Int)) Int (ite (<= x1 y1) (+ (- y1 x1) 1) 0))

(declare-fun concat1 ((Array (_ BitVec 16) integer) (_ BitVec 16)
  (_ BitVec 16) (Array (_ BitVec 16) integer) (_ BitVec 16)
  (_ BitVec 16)) (Array (_ BitVec 16) integer))

;; concat_def
  (assert
  (forall ((a (Array (_ BitVec 16) integer))
  (b (Array (_ BitVec 16) integer)))
  (forall ((a_first (_ BitVec 16)) (a_last (_ BitVec 16))
  (b_first (_ BitVec 16)) (b_last (_ BitVec 16)))
  (forall ((i (_ BitVec 16)))
  (! (and
     (=> (and (bvule a_first i) (bvule i a_last))
     (= (select (concat1 a a_first a_last b b_first b_last) i) (select a i)))
     (=> (bvugt i a_last)
     (= (select (concat1 a a_first a_last b b_first b_last) i) (select b (bvadd (bvsub i a_last) (bvsub b_first #x0001)))))) :pattern ((select 
  (concat1 a a_first a_last b b_first b_last) i)) )))))

(declare-fun concat_singleton_left (integer (_ BitVec 16)
  (Array (_ BitVec 16) integer) (_ BitVec 16)
  (_ BitVec 16)) (Array (_ BitVec 16) integer))

;; concat_singleton_left_def
  (assert
  (forall ((a integer))
  (forall ((b (Array (_ BitVec 16) integer)))
  (forall ((a_first (_ BitVec 16)) (b_first (_ BitVec 16))
  (b_last (_ BitVec 16)))
  (! (and
     (= (select (concat_singleton_left a a_first b b_first b_last) a_first) a)
     (forall ((i (_ BitVec 16)))
     (! (=> (bvugt i a_first)
        (= (select (concat_singleton_left a a_first b b_first b_last) i) (select b (bvadd (bvsub i a_first) (bvsub b_first #x0001))))) :pattern ((select 
     (concat_singleton_left a a_first b b_first b_last) i)) ))) :pattern (
  (concat_singleton_left a a_first b b_first b_last)) )))))

(declare-fun concat_singleton_right ((Array (_ BitVec 16) integer)
  (_ BitVec 16) (_ BitVec 16) integer) (Array (_ BitVec 16) integer))

;; concat_singleton_right_def
  (assert
  (forall ((a (Array (_ BitVec 16) integer)))
  (forall ((b integer))
  (forall ((a_first (_ BitVec 16)) (a_last (_ BitVec 16)))
  (! (and
     (= (select (concat_singleton_right a a_first a_last b) (bvadd a_last #x0001)) b)
     (forall ((i (_ BitVec 16)))
     (! (=> (and (bvule a_first i) (bvule i a_last))
        (= (select (concat_singleton_right a a_first a_last b) i) (select a i))) :pattern ((select 
     (concat_singleton_right a a_first a_last b) i)) :pattern ((select a i)) ))) :pattern (
  (concat_singleton_right a a_first a_last b)) )))))

(declare-fun concat_singletons (integer (_ BitVec 16)
  integer) (Array (_ BitVec 16) integer))

;; concat_singletons_def
  (assert
  (forall ((a integer) (b integer))
  (forall ((a_first (_ BitVec 16)))
  (! (and (= (select (concat_singletons a a_first b) a_first) a)
     (= (select (concat_singletons a a_first b) (bvadd a_first #x0001)) b)) :pattern (
  (concat_singletons a a_first b)) ))))

(declare-fun singleton1 (integer
  (_ BitVec 16)) (Array (_ BitVec 16) integer))

;; singleton_def
  (assert
  (forall ((v integer))
  (forall ((i (_ BitVec 16)))
  (! (= (select (singleton1 v i) i) v) :pattern ((select (singleton1 v i) i)) ))))

(declare-datatypes ((t22s__ref 0))
(((t22s__refqtmk (t22s__content us_t)))))
(define-fun t22s__ref_t22s__content__projection ((a t22s__ref)) us_t 
  (t22s__content a))

(declare-datatypes ((t24s__ref 0))
(((t24s__refqtmk (t24s__content us_t)))))
(define-fun t24s__ref_t24s__content__projection ((a t24s__ref)) us_t 
  (t24s__content a))

(declare-datatypes ((t26s__ref 0))
(((t26s__refqtmk (t26s__content us_t)))))
(define-fun t26s__ref_t26s__content__projection ((a t26s__ref)) us_t 
  (t26s__content a))

;; to_model__post_axiom
  (assert
  (forall ((r us_rep))
  (! (let ((result (to_model r)))
     (=> (to_model__function_guard result r) (dynamic_invariant3 result true
     false true true))) :pattern ((to_model r)) )))

;; to_model__def_axiom
  (assert
  (forall ((r us_rep))
  (! (= (to_model r) (ite (< 65535 (- (+ (bv2nat (to_rep
                                                 (rec__ring_buf__ring_buffer__first
                                                 (us_split_fields1 r)))) 
                     (to_rep2
                     (rec__ring_buf__ring_buffer__length
                     (us_split_fields1 r)))) 1))
                     (let ((temp___227 (let ((temp___224 (bvsub (bvsub (bvadd #x0000 ((_ int2bv 16) 
                                       (to_rep2
                                       (rec__ring_buf__ring_buffer__length
                                       (us_split_fields1 r))))) (bvsub #xFFFF 
                                       (to_rep
                                       (rec__ring_buf__ring_buffer__first
                                       (us_split_fields1 r))))) #x0001)))
                                       (let ((temp___223 #x0000))
                                       (let ((temp___225 (rec__ring_buf__ring_buffer__data
                                                         (us_split_fields1 r))))
                                       (of_array temp___225 temp___223
                                       temp___224))))))
                     (let ((temp___226 (let ((temp___221 #xFFFF))
                                       (let ((temp___220 (to_rep
                                                         (rec__ring_buf__ring_buffer__first
                                                         (us_split_fields1 r)))))
                                       (let ((temp___222 (rec__ring_buf__ring_buffer__data
                                                         (us_split_fields1 r))))
                                       (of_array temp___222 temp___220
                                       temp___221))))))
                     (ite (= (length temp___226) 0)
                     (of_array (to_array temp___227) (first1 temp___227)
                     (last1 temp___227))
                     (of_array
                     (concat1 (to_array temp___226) (first1 temp___226)
                     (last1 temp___226) (to_array temp___227)
                     (first1 temp___227) (last1 temp___227))
                     (first1 temp___226)
                     ((_ int2bv 16) (- (+ (bv2nat (first1 temp___226)) (+ 
                     (length1 (bv2nat (first1 temp___226))
                     (bv2nat (last1 temp___226))) (length1
                                                  (bv2nat (first1 temp___227))
                                                  (bv2nat (last1 temp___227))))) 1))))))
                     (let ((temp___231 (let ((temp___229 (bvsub (bvadd 
                                       (to_rep
                                       (rec__ring_buf__ring_buffer__first
                                       (us_split_fields1 r))) ((_ int2bv 16) 
                                       (to_rep2
                                       (rec__ring_buf__ring_buffer__length
                                       (us_split_fields1 r))))) #x0001)))
                                       (let ((temp___228 (to_rep
                                                         (rec__ring_buf__ring_buffer__first
                                                         (us_split_fields1 r)))))
                                       (let ((temp___230 (rec__ring_buf__ring_buffer__data
                                                         (us_split_fields1 r))))
                                       (of_array temp___230 temp___228
                                       temp___229))))))
                     (of_array (to_array temp___231) (first1 temp___231)
                     (last1 temp___231))))) :pattern ((to_model r)) )))

;; func_head__post_axiom
  (assert
  (forall ((m us_t))
  (! (=> (and (dynamic_invariant3 m true true true true) (< 0 (length m)))
     (let ((result (func_head m)))
     (=> (func_head__function_guard result m) (dynamic_invariant result true
     false true true)))) :pattern ((func_head m)) )))

;; func_head__def_axiom
  (assert
  (forall ((m us_t))
  (! (=> (dynamic_invariant3 m true true true true)
     (= (func_head m) (to_rep1 (select (to_array m) (first1 m))))) :pattern (
  (func_head m)) )))

;; func_push__post_axiom
  (assert
  (forall ((m us_t))
  (forall ((x1 Int))
  (! (=>
     (and (dynamic_invariant3 m true true true true) (dynamic_invariant x1
     true true true true))
     (let ((result (func_push m x1)))
     (=> (func_push__function_guard result m x1) (dynamic_invariant3 result
     true false true true)))) :pattern ((func_push m x1)) ))))

;; func_push__def_axiom
  (assert
  (forall ((m us_t))
  (forall ((x1 Int))
  (! (=>
     (and (dynamic_invariant3 m true true true true) (dynamic_invariant x1
     true true true true))
     (= (func_push m x1) (ite (= (length m) 0)
                         (of_array (singleton1 (of_rep1 x1) #x0000) #x0000
                         #x0000)
                         (of_array
                         (concat_singleton_right (to_array m) (first1 m)
                         (last1 m) (of_rep1 x1)) (first1 m)
                         ((_ int2bv 16) (- (+ (bv2nat (first1 m)) (+ 
                         (length1 (bv2nat (first1 m)) (bv2nat (last1 m))) 1)) 1)))))) :pattern (
  (func_push m x1)) ))))

(declare-datatypes ((t32s__ref 0))
(((t32s__refqtmk (t32s__content us_t)))))
(define-fun t32s__ref_t32s__content__projection ((a t32s__ref)) us_t 
  (t32s__content a))

;; func_pop__post_axiom
  (assert
  (forall ((m us_t))
  (! (=> (and (dynamic_invariant3 m true true true true) (< 0 (length m)))
     (let ((result (func_pop m)))
     (=> (func_pop__function_guard result m) (dynamic_invariant3 result true
     false true true)))) :pattern ((func_pop m)) )))

;; func_pop__def_axiom
  (assert
  (forall ((m us_t))
  (! (=> (dynamic_invariant3 m true true true true)
     (= (func_pop m) (let ((temp___269 (let ((temp___268 (bvsub (last1 m) #x0001)))
                                       (let ((temp___267 (first1 m)))
                                       (of_array (to_array m) temp___267
                                       temp___268)))))
                     (of_array (to_array temp___269) (first1 temp___269)
                     (last1 temp___269))))) :pattern ((func_pop m)) )))

;; is_full__post_axiom
  (assert true)

;; is_full__def_axiom
  (assert
  (forall ((r us_rep))
  (! (= (= (is_full r) true)
     (= (to_rep2 (rec__ring_buf__ring_buffer__length (us_split_fields1 r))) 65536)) :pattern (
  (is_full r)) )))

;; is_empty__post_axiom
  (assert true)

;; is_empty__def_axiom
  (assert
  (forall ((r us_rep))
  (! (= (= (is_empty r) true)
     (= (to_rep2 (rec__ring_buf__ring_buffer__length (us_split_fields1 r))) 0)) :pattern (
  (is_empty r)) )))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___235 Int))
  (=> (dynamic_invariant temp___235 true true true true)
  (forall ((temp___236 (_ BitVec 16)))
  (= (select (temp_____aggregate_def_233 temp___235) temp___236) rliteral)))))

(assert
;; defqtvc
 ;; File "harness.adb", line 3, characters 0-0
  (not
  (forall ((h Int) (r__split_fields us_split_fields))
  (=> (dynamic_invariant x true false true true)
  (=> (dynamic_invariant y true false true true)
  (=> (dynamic_invariant z true false true true)
  (=> (dynamic_invariant h false false true true)
  (=>
  (forall ((r__split_fields1 us_split_fields)) (to_model__function_guard
  (to_model (us_repqtmk r__split_fields1)) (us_repqtmk r__split_fields1)))
  (=>
  (= (let ((temp___239 (to_model (us_repqtmk r__split_fields))))
     (bool_eq (to_array temp___239) (first1 temp___239) (last1 temp___239)
     (temp_____aggregate_def_233 0) #x0001 #x0000)) true)
  (forall ((r__split_fields1 us_split_fields))
  (=>
  (forall ((r__split_fields2 us_split_fields)) (to_model__function_guard
  (to_model (us_repqtmk r__split_fields2)) (us_repqtmk r__split_fields2)))
  (=>
  (forall ((r__split_fields2 us_split_fields)) (to_model__function_guard
  (to_model (us_repqtmk r__split_fields2)) (us_repqtmk r__split_fields2)))
  (=>
  (forall ((r__split_fields2 us_split_fields) (o Int))
  (func_push__function_guard
  (func_push (to_model (us_repqtmk r__split_fields2)) o)
  (to_model (us_repqtmk r__split_fields2)) o))
  (=>
  (forall ((r__split_fields2 us_split_fields)) (to_model__function_guard
  (to_model (us_repqtmk r__split_fields2)) (us_repqtmk r__split_fields2)))
  (=>
  (= (let ((temp___255 (func_push (to_model (us_repqtmk r__split_fields)) x)))
     (let ((temp___254 (to_model (us_repqtmk r__split_fields1))))
     (bool_eq (to_array temp___254) (first1 temp___254) (last1 temp___254)
     (to_array temp___255) (first1 temp___255) (last1 temp___255)))) true)
  (=>
  (forall ((r__split_fields2 us_split_fields)) (is_full__function_guard
  (is_full (us_repqtmk r__split_fields2)) (us_repqtmk r__split_fields2)))
  (not (= (is_full (us_repqtmk r__split_fields1)) true))))))))))))))))))
(check-sat)
(exit)
