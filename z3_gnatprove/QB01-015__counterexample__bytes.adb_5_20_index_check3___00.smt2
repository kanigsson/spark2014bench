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

(declare-fun nth1 ((_ BitVec 16) Int) Bool)

(declare-fun lsr1 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun asr1 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun lsl1 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun rotate_right2 ((_ BitVec 16) Int) (_ BitVec 16))

(declare-fun rotate_left2 ((_ BitVec 16) Int) (_ BitVec 16))

(define-fun to_int2 ((x (_ BitVec 16))) Int (ite (bvsge x (_ bv0 16))
                                            (bv2int x)
                                            (- (- 65536 (bv2int x)))))

(define-fun uint_in_range1 ((i Int)) Bool (and (<= 0 i) (<= i 65535)))

(declare-fun nth_bv1 ((_ BitVec 16) (_ BitVec 16)) Bool)

(declare-fun eq_sub_bv1 ((_ BitVec 16) (_ BitVec 16) (_ BitVec 16)
  (_ BitVec 16)) Bool)

(define-fun eq_sub1 ((a (_ BitVec 16)) (b (_ BitVec 16)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth1 a j) (nth1 b j)))))

(declare-datatypes () ((t__ref1 (t__refqtmk1 (t__content1 (_ BitVec 16))))))
(declare-fun power1 ((_ BitVec 16) Int) (_ BitVec 16))

(define-fun bv_min1 ((x (_ BitVec 16))
  (y (_ BitVec 16))) (_ BitVec 16) (ite (bvule x y) x y))

(define-fun bv_max1 ((x (_ BitVec 16))
  (y (_ BitVec 16))) (_ BitVec 16) (ite (bvule x y) y x))

(declare-sort uint16 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 16))

(declare-fun attr__ATTRIBUTE_IMAGE ((_ BitVec 16)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) (_ BitVec 16))

(declare-fun user_eq (uint16 uint16) Bool)

(declare-const dummy uint16)

(declare-datatypes ()
((uint16__ref (uint16__refqtmk (uint16__content uint16)))))
(define-fun uint16__ref_uint16__content__projection ((a uint16__ref)) uint16 
  (uint16__content a))

(declare-sort uint8 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 8))

(declare-fun user_eq1 (uint8 uint8) Bool)

(declare-const dummy1 uint8)

(declare-datatypes () ((uint8__ref (uint8__refqtmk (uint8__content uint8)))))
(define-fun uint8__ref_uint8__content__projection ((a uint8__ref)) uint8 
  (uint8__content a))

(declare-fun to_rep (uint8) (_ BitVec 8))

(declare-fun of_rep ((_ BitVec 8)) uint8)

;; inversion_axiom
  (assert
  (forall ((x uint8)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (= (to_rep (of_rep x)) x) :pattern ((to_rep (of_rep x))) )))

(define-fun to_int3 ((x uint8)) Int (bv2int (to_rep x)))

;; range_int_axiom
  (assert
  (forall ((x uint8)) (! (uint_in_range
  (to_int3 x)) :pattern ((to_int3 x)) )))

(declare-fun to_rep1 (uint16) (_ BitVec 16))

(declare-fun of_rep1 ((_ BitVec 16)) uint16)

;; inversion_axiom
  (assert
  (forall ((x uint16))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 16)))
  (! (= (to_rep1 (of_rep1 x)) x) :pattern ((to_rep1 (of_rep1 x))) )))

(define-fun to_int4 ((x uint16)) Int (bv2int (to_rep1 x)))

;; range_int_axiom
  (assert
  (forall ((x uint16)) (! (uint_in_range1
  (to_int4 x)) :pattern ((to_int4 x)) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array (_ BitVec 16) uint8))))))
(declare-fun slide ((Array (_ BitVec 16) uint8) (_ BitVec 16)
  (_ BitVec 16)) (Array (_ BitVec 16) uint8))

;; slide_eq
  (assert
  (forall ((a (Array (_ BitVec 16) uint8)))
  (forall ((first (_ BitVec 16)))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array (_ BitVec 16) uint8)))
  (forall ((old_first (_ BitVec 16)))
  (forall ((new_first (_ BitVec 16)))
  (forall ((i (_ BitVec 16)))
  (! (= (select (slide a old_first new_first) i) (select a (bvsub i (bvsub new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array (_ BitVec 16) uint8)) (a__first (_ BitVec 16))
  (a__last (_ BitVec 16)) (b (Array (_ BitVec 16) uint8))
  (b__first (_ BitVec 16))
  (b__last (_ BitVec 16))) Bool (ite (and
                                     (ite (bvule a__first a__last)
                                     (and (bvule b__first b__last)
                                     (= (bvsub a__last a__first) (bvsub b__last b__first)))
                                     (bvugt b__first b__last))
                                     (forall ((temp___idx_154 (_ BitVec 16)))
                                     (=>
                                     (and (bvule a__first temp___idx_154)
                                     (bvule temp___idx_154 a__last))
                                     (= (to_rep (select a temp___idx_154)) 
                                     (to_rep
                                     (select b (bvadd (bvsub b__first a__first) temp___idx_154)))))))
                                true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array (_ BitVec 16) uint8)) (b (Array (_ BitVec 16) uint8)))
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
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (bvadd (bvsub b__first a__first) temp___idx_154)))))))))))

(declare-const dummy2 (Array (_ BitVec 16) uint8))

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

(declare-fun user_eq2 ((Array (_ BitVec 16) uint8)
  (Array (_ BitVec 16) uint8)) Bool)

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__bytes__record_struct__id uint16)(rec__bytes__record_struct__length uint8)(rec__bytes__record_struct__payload (Array (_ BitVec 16) uint8))))))
(define-fun us_split_fields_rec__bytes__record_struct__id__projection ((a us_split_fields)) uint16 
  (rec__bytes__record_struct__id a))

(define-fun us_split_fields_rec__bytes__record_struct__length__projection ((a us_split_fields)) uint8 
  (rec__bytes__record_struct__length a))

(define-fun us_split_fields_rec__bytes__record_struct__payload__projection ((a us_split_fields)) (Array (_ BitVec 16) uint8) 
  (rec__bytes__record_struct__payload a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep1
                           (rec__bytes__record_struct__id
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__bytes__record_struct__id
                                                  (us_split_fields1 b))))
                        (= (to_rep
                           (rec__bytes__record_struct__length
                           (us_split_fields1 a))) (to_rep
                                                  (rec__bytes__record_struct__length
                                                  (us_split_fields1 b)))))
                        (= (bool_eq
                           (rec__bytes__record_struct__payload
                           (us_split_fields1 a)) #x0001 #x0100
                           (rec__bytes__record_struct__payload
                           (us_split_fields1 b)) #x0001 #x0100) true))
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

(declare-const bytes__record_struct__id__first__bit Int)

(declare-const bytes__record_struct__id__last__bit Int)

(declare-const bytes__record_struct__id__position Int)

;; bytes__record_struct__id__first__bit_axiom
  (assert (<= 0 bytes__record_struct__id__first__bit))

;; bytes__record_struct__id__last__bit_axiom
  (assert
  (< bytes__record_struct__id__first__bit bytes__record_struct__id__last__bit))

;; bytes__record_struct__id__position_axiom
  (assert (<= 0 bytes__record_struct__id__position))

(declare-const bytes__record_struct__length__first__bit Int)

(declare-const bytes__record_struct__length__last__bit Int)

(declare-const bytes__record_struct__length__position Int)

;; bytes__record_struct__length__first__bit_axiom
  (assert (<= 0 bytes__record_struct__length__first__bit))

;; bytes__record_struct__length__last__bit_axiom
  (assert
  (< bytes__record_struct__length__first__bit bytes__record_struct__length__last__bit))

;; bytes__record_struct__length__position_axiom
  (assert (<= 0 bytes__record_struct__length__position))

(declare-const bytes__record_struct__payload__first__bit Int)

(declare-const bytes__record_struct__payload__last__bit Int)

(declare-const bytes__record_struct__payload__position Int)

;; bytes__record_struct__payload__first__bit_axiom
  (assert (<= 0 bytes__record_struct__payload__first__bit))

;; bytes__record_struct__payload__last__bit_axiom
  (assert
  (< bytes__record_struct__payload__first__bit bytes__record_struct__payload__last__bit))

;; bytes__record_struct__payload__position_axiom
  (assert (<= 0 bytes__record_struct__payload__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ()
((record_struct__ref
 (record_struct__refqtmk (record_struct__content us_rep)))))
(define-fun record_struct__ref_record_struct__content__projection ((a record_struct__ref)) us_rep 
  (record_struct__content a))

(declare-const a_record us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const output__first uint16)

(declare-const output__last uint16)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant ((temp___expr_166 (_ BitVec 16))
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool) (temp___do_typ_inv_165 Bool)) Bool true)

(declare-sort t 0)

(declare-fun first (t) uint16)

(declare-fun last (t) uint16)

(declare-fun mk ((_ BitVec 16) (_ BitVec 16)) t)

;; mk_def
  (assert
  (forall ((f (_ BitVec 16)) (l (_ BitVec 16)))
  (! (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first (_ BitVec 16))
  (range_last (_ BitVec 16)) (low (_ BitVec 16))
  (high (_ BitVec 16))) Bool true)

(declare-datatypes ()
((us_t (us_tqtmk (elts (Array (_ BitVec 16) uint8))(rt t)))))
(define-fun to_array ((a us_t)) (Array (_ BitVec 16) uint8) (elts a))

(define-fun of_array ((a (Array (_ BitVec 16) uint8)) (f (_ BitVec 16))
  (l (_ BitVec 16))) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) (_ BitVec 16) (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) (_ BitVec 16) (to_rep1 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (bvule (first1 a) (last1 a))
                                  (+ (- (bv2int (last1 a)) (bv2int (first1 a))) 1)
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

(define-fun bool_eq2 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ()
((bytearray__ref (bytearray__refqtmk (bytearray__content us_t)))))
(define-fun bytearray__ref_bytearray__content__projection ((a bytearray__ref)) us_t 
  (bytearray__content a))

(define-fun dynamic_invariant1 ((temp___expr_159 (_ BitVec 8))
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool) (temp___do_typ_inv_158 Bool)) Bool true)

(define-fun dynamic_invariant2 ((temp___expr_173 us_t)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (=>
                                     (not (= temp___skip_constant_170 true))
                                     (dynamic_property #x0000 #xFFFF
                                     (first1 temp___expr_173)
                                     (last1 temp___expr_173))))

(declare-const length1 (_ BitVec 16))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_property #x0000 #xFFFF (to_rep1 output__first)
  (to_rep1 output__last)))

;; Assume
  (assert (dynamic_invariant length1 false false true true))

(declare-const o (_ BitVec 8))

;; Ensures
  (assert
  (= (to_rep (rec__bytes__record_struct__length (us_split_fields1 a_record))) 
  o))

(declare-const o1 uint8)

;; Ensures
  (assert (= (to_rep o1) o))

(declare-const temp___202 (_ BitVec 16))

;; Ensures
  (assert (= (to_rep1 output__first) temp___202))

(assert
;; defqtvc
 ;; File "bytes.ads", line 14, characters 0-0
  (not (bvule (to_rep1 output__first) temp___202)))
(check-sat)
