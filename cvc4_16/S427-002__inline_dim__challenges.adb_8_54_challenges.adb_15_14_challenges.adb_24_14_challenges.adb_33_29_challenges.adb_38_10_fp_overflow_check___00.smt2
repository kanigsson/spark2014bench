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
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite64 ((x Float64)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral64 ((x Float64)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
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

(declare-fun pow2 (Int) Int)

(define-fun is_plus_infinity ((x Float64)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float64)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float64)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float64)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

(declare-const max_int Int)

(define-fun in_int_range ((i Int)) Bool (and (<= (- max_int) i)
                                        (<= i max_int)))

(define-fun in_safe_int_range ((i Int)) Bool (and (<= (- 9007199254740992) i)
                                             (<= i 9007199254740992)))

(define-fun same_sign ((x Float64)
  (y Float64)) Bool (or (and (fp.isPositive x) (fp.isPositive y))
                    (and (fp.isNegative x) (fp.isNegative y))))

(define-fun diff_sign ((x Float64)
  (y Float64)) Bool (or (and (fp.isPositive x) (fp.isNegative y))
                    (and (fp.isNegative x) (fp.isPositive y))))

(define-fun product_sign ((z Float64) (x Float64)
  (y Float64)) Bool (and (=> (same_sign x y) (fp.isPositive z))
                    (=> (diff_sign x y) (fp.isNegative z))))

(define-fun sqr ((x Real)) Real (* x x))

(declare-fun sqrt1 (Real) Real)

(define-fun same_sign_real ((x Float64)
  (r Real)) Bool (or (and (fp.isPositive x) (< 0.0 r))
                 (and (fp.isNegative x) (< r 0.0))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content Float64)))))
(declare-sort length 0)

(define-fun in_range ((x Float64)) Bool (and (fp.isFinite64 x)
                                        (and
                                        (fp.leq (fp.neg (fp #b0 #b10000010010 #b1110100001001000000000000000000000000000000000000000)) x)
                                        (fp.leq x (fp #b0 #b10000010010 #b1110100001001000000000000000000000000000000000000000)))))

(declare-fun user_eq (length length) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Float64)

(declare-const dummy length)

(declare-datatypes ((length__ref 0))
(((length__refqtmk (length__content length)))))
(define-fun length__ref_length__content__projection ((a length__ref)) length 
  (length__content a))

(declare-fun to_rep (length) Float64)

(declare-fun of_rep (Float64) length)

;; inversion_axiom
  (assert
  (forall ((x length)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x length)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Float64))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__dimensions__position_type__x length)(rec__dimensions__position_type__y length)))))
(define-fun us_split_fields_rec__dimensions__position_type__x__projection ((a us_split_fields)) length 
  (rec__dimensions__position_type__x a))

(define-fun us_split_fields_rec__dimensions__position_type__y__projection ((a us_split_fields)) length 
  (rec__dimensions__position_type__y a))

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
                        (fp.eq (to_rep
                               (rec__dimensions__position_type__x
                               (us_split_fields1 a))) (to_rep
                                                      (rec__dimensions__position_type__x
                                                      (us_split_fields1 b))))
                        (fp.eq (to_rep
                               (rec__dimensions__position_type__y
                               (us_split_fields1 a))) (to_rep
                                                      (rec__dimensions__position_type__y
                                                      (us_split_fields1 b)))))
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

(declare-const dimensions__position_type__x__first__bit Int)

(declare-const dimensions__position_type__x__last__bit Int)

(declare-const dimensions__position_type__x__position Int)

;; dimensions__position_type__x__first__bit_axiom
  (assert (<= 0 dimensions__position_type__x__first__bit))

;; dimensions__position_type__x__last__bit_axiom
  (assert
  (< dimensions__position_type__x__first__bit dimensions__position_type__x__last__bit))

;; dimensions__position_type__x__position_axiom
  (assert (<= 0 dimensions__position_type__x__position))

(declare-const dimensions__position_type__y__first__bit Int)

(declare-const dimensions__position_type__y__last__bit Int)

(declare-const dimensions__position_type__y__position Int)

;; dimensions__position_type__y__first__bit_axiom
  (assert (<= 0 dimensions__position_type__y__first__bit))

;; dimensions__position_type__y__last__bit_axiom
  (assert
  (< dimensions__position_type__y__first__bit dimensions__position_type__y__last__bit))

;; dimensions__position_type__y__position_axiom
  (assert (<= 0 dimensions__position_type__y__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((position_type__ref 0))
(((position_type__refqtmk (position_type__content us_rep)))))
(define-fun position_type__ref_position_type__content__projection ((a position_type__ref)) us_rep 
  (position_type__content a))

(declare-sort normalized_angle 0)

(define-fun in_range1 ((x Float64)) Bool (and (fp.isFinite64 x)
                                         (and
                                         (fp.leq (fp.neg (fp #b0 #b10000000000 #b1001001000011111101101010100010001000010110100011000)) x)
                                         (fp.leq x (fp #b0 #b10000000000 #b1001001000011111101101010100010001000010110100011000)))))

(declare-fun user_eq2 (normalized_angle normalized_angle) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float64)

(declare-const dummy2 normalized_angle)

(declare-datatypes ((normalized_angle__ref 0))
(((normalized_angle__refqtmk (normalized_angle__content normalized_angle)))))
(define-fun normalized_angle__ref_normalized_angle__content__projection ((a normalized_angle__ref)) normalized_angle 
  (normalized_angle__content a))

(declare-fun to_rep1 (normalized_angle) Float64)

(declare-fun of_rep1 (Float64) normalized_angle)

;; inversion_axiom
  (assert
  (forall ((x normalized_angle))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x normalized_angle)) (! (in_range1
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Float64))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__dimensions__pose_type__pos us_rep)(rec__dimensions__pose_type__heading normalized_angle)))))
(define-fun us_split_fields_rec__dimensions__pose_type__pos__projection ((a us_split_fields2)) us_rep 
  (rec__dimensions__pose_type__pos a))

(define-fun us_split_fields_rec__dimensions__pose_type__heading__projection ((a us_split_fields2)) normalized_angle 
  (rec__dimensions__pose_type__heading a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (bool_eq
                            (rec__dimensions__pose_type__pos
                            (us_split_fields3 a))
                            (rec__dimensions__pose_type__pos
                            (us_split_fields3 b))) true)
                         (fp.eq (to_rep1
                                (rec__dimensions__pose_type__heading
                                (us_split_fields3 a))) (to_rep1
                                                       (rec__dimensions__pose_type__heading
                                                       (us_split_fields3 b)))))
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

(declare-const dimensions__pose_type__pos__first__bit Int)

(declare-const dimensions__pose_type__pos__last__bit Int)

(declare-const dimensions__pose_type__pos__position Int)

;; dimensions__pose_type__pos__first__bit_axiom
  (assert (<= 0 dimensions__pose_type__pos__first__bit))

;; dimensions__pose_type__pos__last__bit_axiom
  (assert
  (< dimensions__pose_type__pos__first__bit dimensions__pose_type__pos__last__bit))

;; dimensions__pose_type__pos__position_axiom
  (assert (<= 0 dimensions__pose_type__pos__position))

(declare-const dimensions__pose_type__heading__first__bit Int)

(declare-const dimensions__pose_type__heading__last__bit Int)

(declare-const dimensions__pose_type__heading__position Int)

;; dimensions__pose_type__heading__first__bit_axiom
  (assert (<= 0 dimensions__pose_type__heading__first__bit))

;; dimensions__pose_type__heading__last__bit_axiom
  (assert
  (< dimensions__pose_type__heading__first__bit dimensions__pose_type__heading__last__bit))

;; dimensions__pose_type__heading__position_axiom
  (assert (<= 0 dimensions__pose_type__heading__position))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((pose_type__ref 0))
(((pose_type__refqtmk (pose_type__content us_rep1)))))
(define-fun pose_type__ref_pose_type__content__projection ((a pose_type__ref)) us_rep1 
  (pose_type__content a))

(declare-const pose us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ((us_split_fields4 0))
(((us_split_fieldsqtmk2
  (rec__dimensions__vector_type__dx length)(rec__dimensions__vector_type__dy length)))))
(define-fun us_split_fields_rec__dimensions__vector_type__dx__projection ((a us_split_fields4)) length 
  (rec__dimensions__vector_type__dx a))

(define-fun us_split_fields_rec__dimensions__vector_type__dy__projection ((a us_split_fields4)) length 
  (rec__dimensions__vector_type__dy a))

(declare-datatypes ((us_split_fields__ref2 0))
(((us_split_fields__refqtmk2 (us_split_fields__content2 us_split_fields4)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref2)) us_split_fields4 
  (us_split_fields__content2 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2 (us_split_fields5 us_split_fields4)))))
(define-fun us_rep___split_fields__3__projection ((a us_rep2)) us_split_fields4 
  (us_split_fields5 a))

(define-fun bool_eq2 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (fp.eq (to_rep
                                (rec__dimensions__vector_type__dx
                                (us_split_fields5 a))) (to_rep
                                                       (rec__dimensions__vector_type__dx
                                                       (us_split_fields5 b))))
                         (fp.eq (to_rep
                                (rec__dimensions__vector_type__dy
                                (us_split_fields5 a))) (to_rep
                                                       (rec__dimensions__vector_type__dy
                                                       (us_split_fields5 b)))))
                    true false))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const dimensions__vector_type__dx__first__bit Int)

(declare-const dimensions__vector_type__dx__last__bit Int)

(declare-const dimensions__vector_type__dx__position Int)

;; dimensions__vector_type__dx__first__bit_axiom
  (assert (<= 0 dimensions__vector_type__dx__first__bit))

;; dimensions__vector_type__dx__last__bit_axiom
  (assert
  (< dimensions__vector_type__dx__first__bit dimensions__vector_type__dx__last__bit))

;; dimensions__vector_type__dx__position_axiom
  (assert (<= 0 dimensions__vector_type__dx__position))

(declare-const dimensions__vector_type__dy__first__bit Int)

(declare-const dimensions__vector_type__dy__last__bit Int)

(declare-const dimensions__vector_type__dy__position Int)

;; dimensions__vector_type__dy__first__bit_axiom
  (assert (<= 0 dimensions__vector_type__dy__first__bit))

;; dimensions__vector_type__dy__last__bit_axiom
  (assert
  (< dimensions__vector_type__dy__first__bit dimensions__vector_type__dy__last__bit))

;; dimensions__vector_type__dy__position_axiom
  (assert (<= 0 dimensions__vector_type__dy__position))

(declare-fun user_eq4 (us_rep2 us_rep2) Bool)

(declare-const dummy4 us_rep2)

(declare-datatypes ((vector_type__ref 0))
(((vector_type__refqtmk (vector_type__content us_rep2)))))
(define-fun vector_type__ref_vector_type__content__projection ((a vector_type__ref)) us_rep2 
  (vector_type__content a))

(declare-fun sqrt2 (Float64) Float64)

(declare-fun sqrt__function_guard (Float64 Float64) Bool)

(declare-sort tmks_typeB 0)

(declare-fun user_eq5 (tmks_typeB tmks_typeB) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE2 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Float64)

(declare-const dummy5 tmks_typeB)

(declare-datatypes ((tmks_typeB__ref 0))
(((tmks_typeB__refqtmk (tmks_typeB__content tmks_typeB)))))
(define-fun tmks_typeB__ref_tmks_typeB__content__projection ((a tmks_typeB__ref)) tmks_typeB 
  (tmks_typeB__content a))

;; sqrt__post_axiom
  (assert
  (forall ((x Float64))
  (! (=>
     (and (fp.isFinite64 x)
     (fp.leq (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000) x))
     (let ((result (sqrt2 x)))
     (and
     (and
     (and
     (and
     (fp.leq (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000) result)
     (=>
     (fp.eq x (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000))
     (fp.eq result (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000))))
     (=>
     (fp.eq x (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000))
     (fp.eq result (fp #b0 #b01111111111 #b0000000000000000000000000000000000000000000000000000))))
     (=>
     (fp.leq (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000001) x)
     (fp.lt (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000) result)))
     (fp.isFinite64 result)))) :pattern ((sqrt2 x)) )))

(declare-const c34b us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const start_pose us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const c36b us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const c37b us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const c38b Float64)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const c41b us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const c42b us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const dx Float64)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const dy Float64)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-const c46b us_rep2)

(declare-const attr__ATTRIBUTE_ADDRESS12 Int)

(declare-const attr__ATTRIBUTE_ADDRESS13 Int)

(define-fun dynamic_invariant ((temp___expr_173 Float64)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (=>
                                     (or (= temp___is_init_169 true)
                                     (fp.leq (fp.neg (fp #b0 #b10000010010 #b1110100001001000000000000000000000000000000000000000)) (fp #b0 #b10000010010 #b1110100001001000000000000000000000000000000000000000)))
                                     (in_range temp___expr_173)))

(declare-sort non_negative_length 0)

(define-fun in_range2 ((x Float64)) Bool (and (fp.isFinite64 x)
                                         (and
                                         (fp.leq (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000) x)
                                         (fp.leq x (fp #b0 #b10000010010 #b1110100001001000000000000000000000000000000000000000)))))

(declare-fun user_eq6 (non_negative_length non_negative_length) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE3 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Float64)

(declare-const dummy6 non_negative_length)

(declare-datatypes ((non_negative_length__ref 0))
(((non_negative_length__refqtmk
  (non_negative_length__content non_negative_length)))))
(define-fun non_negative_length__ref_non_negative_length__content__projection ((a non_negative_length__ref)) non_negative_length 
  (non_negative_length__content a))

(define-fun dynamic_invariant1 ((temp___expr_214 Float64)
  (temp___is_init_210 Bool) (temp___skip_constant_211 Bool)
  (temp___do_toplevel_212 Bool)
  (temp___do_typ_inv_213 Bool)) Bool (=>
                                     (or (= temp___is_init_210 true)
                                     (fp.leq (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000) (fp #b0 #b10000010010 #b1110100001001000000000000000000000000000000000000000)))
                                     (in_range2 temp___expr_214)))

(declare-sort area 0)

(define-fun in_range3 ((x Float64)) Bool (and (fp.isFinite64 x)
                                         (and
                                         (fp.leq (fp.neg (fp #b0 #b10000100110 #b1101000110101001010010100010000000000000000000000000)) x)
                                         (fp.leq x (fp #b0 #b10000100110 #b1101000110101001010010100010000000000000000000000000)))))

(declare-fun user_eq7 (area area) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE4 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Float64)

(declare-const dummy7 area)

(declare-datatypes ((area__ref 0))
(((area__refqtmk (area__content area)))))
(define-fun area__ref_area__content__projection ((a area__ref)) area 
  (area__content a))

(declare-sort short_length 0)

(define-fun in_range4 ((x Float64)) Bool (and (fp.isFinite64 x)
                                         (and
                                         (fp.leq (fp.neg (fp #b0 #b10000000100 #b1001000000000000000000000000000000000000000000000000)) x)
                                         (fp.leq x (fp #b0 #b10000000100 #b1001000000000000000000000000000000000000000000000000)))))

(declare-fun user_eq8 (short_length short_length) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE5 (Float64) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Float64)

(declare-const dummy8 short_length)

(declare-datatypes ((short_length__ref 0))
(((short_length__refqtmk (short_length__content short_length)))))
(define-fun short_length__ref_short_length__content__projection ((a short_length__ref)) short_length 
  (short_length__content a))

(define-fun dynamic_invariant2 ((temp___expr_251 Float64)
  (temp___is_init_247 Bool) (temp___skip_constant_248 Bool)
  (temp___do_toplevel_249 Bool)
  (temp___do_typ_inv_250 Bool)) Bool (=>
                                     (or (= temp___is_init_247 true)
                                     (fp.leq (fp.neg (fp #b0 #b10000000100 #b1001000000000000000000000000000000000000000000000000)) (fp #b0 #b10000000100 #b1001000000000000000000000000000000000000000000000000)))
                                     (in_range4 temp___expr_251)))

(define-fun dynamic_invariant3 ((temp___expr_196 Float64)
  (temp___is_init_192 Bool) (temp___skip_constant_193 Bool)
  (temp___do_toplevel_194 Bool)
  (temp___do_typ_inv_195 Bool)) Bool (=>
                                     (or (= temp___is_init_192 true)
                                     (fp.leq (fp.neg (fp #b0 #b10000000000 #b1001001000011111101101010100010001000010110100011000)) (fp #b0 #b10000000000 #b1001001000011111101101010100010001000010110100011000)))
                                     (in_range1 temp___expr_196)))

(define-fun dynamic_invariant4 ((temp___expr_237 Float64)
  (temp___is_init_233 Bool) (temp___skip_constant_234 Bool)
  (temp___do_toplevel_235 Bool)
  (temp___do_typ_inv_236 Bool)) Bool (=>
                                     (or (= temp___is_init_233 true)
                                     (fp.leq (fp.neg (fp #b0 #b10000100110 #b1101000110101001010010100010000000000000000000000000)) (fp #b0 #b10000100110 #b1101000110101001010010100010000000000000000000000000)))
                                     (in_range3 temp___expr_237)))

;; start_pose__def_axiom
  (assert
  (= start_pose (us_repqtmk1
                (us_split_fieldsqtmk1
                (us_repqtmk
                (us_split_fieldsqtmk
                (of_rep
                (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000))
                (of_rep
                (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000))))
                (of_rep1
                (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000))))))

;; c34b__def_axiom
  (assert (= c34b (rec__dimensions__pose_type__pos (us_split_fields3 pose))))

;; c36b__def_axiom
  (assert (= c36b start_pose))

;; c37b__def_axiom
  (assert (= c37b c34b))

;; c38b__def_axiom
  (assert
  (= c38b (fp #b0 #b01111111110 #b0011001100110011001100110011001100110011001100110011)))

;; dx__def_axiom
  (assert
  (= dx (fp.sub RNE (to_rep
                    (rec__dimensions__position_type__x
                    (us_split_fields1 c42b))) (to_rep
                                              (rec__dimensions__position_type__x
                                              (us_split_fields1 c41b))))))

;; dy__def_axiom
  (assert
  (= dy (fp.sub RNE (to_rep
                    (rec__dimensions__position_type__y
                    (us_split_fields1 c42b))) (to_rep
                                              (rec__dimensions__position_type__y
                                              (us_split_fields1 c41b))))))

;; c41b__def_axiom
  (assert (= c41b (rec__dimensions__pose_type__pos (us_split_fields3 c36b))))

;; c42b__def_axiom
  (assert (= c42b c37b))

;; c46b__def_axiom
  (assert
  (= c46b (us_repqtmk2 (us_split_fieldsqtmk2 (of_rep dx) (of_rep dy)))))

(assert
;; defqtvc
 ;; File "challenges.ads", line 5, characters 0-0
  (not
  (forall ((c43b Float64) (c47b Float64) (o normalized_angle) (o1 length)
  (o2 length) (remaining_distance Float64) (o3 Float64) (o4 Float64))
  (=> (= (rec__dimensions__pose_type__pos (us_split_fields3 pose)) c34b)
  (=>
  (= (to_rep1 o) (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000))
  (=>
  (= (to_rep o1) (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000))
  (=>
  (= (to_rep o2) (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000))
  (=>
  (= (us_repqtmk1
     (us_split_fieldsqtmk1 (us_repqtmk (us_split_fieldsqtmk o2 o1)) o)) 
  start_pose)
  (=>
  (= remaining_distance (fp #b0 #b00000000000 #b0000000000000000000000000000000000000000000000000000))
  (=> (dynamic_invariant2 remaining_distance true false true true)
  (=> (= start_pose c36b)
  (=> (= c34b c37b)
  (=>
  (= (fp #b0 #b01111111110 #b0011001100110011001100110011001100110011001100110011) 
  c38b)
  (=> (dynamic_invariant2 c38b true false true true)
  (=> (= (rec__dimensions__pose_type__pos (us_split_fields3 c36b)) c41b)
  (=> (= c37b c42b)
  (=> (dynamic_invariant1 c43b false false true true)
  (=>
  (= (to_rep (rec__dimensions__position_type__x (us_split_fields1 c41b))) o3)
  (=>
  (= (to_rep (rec__dimensions__position_type__x (us_split_fields1 c42b))) o4)
  (let ((o5 (fp.sub RNE o4 o3)))
  (=> (fp.isFinite64 o5)
  (=> (= o5 dx)
  (=> (dynamic_invariant dx true false true true)
  (forall ((o6 Float64))
  (=>
  (= (to_rep (rec__dimensions__position_type__y (us_split_fields1 c41b))) o6)
  (forall ((o7 Float64))
  (=>
  (= (to_rep (rec__dimensions__position_type__y (us_split_fields1 c42b))) o7)
  (let ((o8 (fp.sub RNE o7 o6)))
  (=> (fp.isFinite64 o8)
  (=> (= o8 dy)
  (=> (dynamic_invariant dy true false true true)
  (forall ((o9 length))
  (=> (= (to_rep o9) dy)
  (forall ((o10 length))
  (=> (= (to_rep o10) dx)
  (=> (= (us_repqtmk2 (us_split_fieldsqtmk2 o10 o9)) c46b)
  (=> (dynamic_invariant1 c47b false false true true)
  (forall ((o11 Float64))
  (=>
  (= (to_rep (rec__dimensions__vector_type__dy (us_split_fields5 c46b))) o11)
  (forall ((o12 Float64))
  (=>
  (= (to_rep (rec__dimensions__vector_type__dy (us_split_fields5 c46b))) o12)
  (let ((o13 (fp.mul RNE o12 o11)))
  (=> (fp.isFinite64 o13)
  (=> (fp.isFinite64 o13)
  (forall ((o14 Float64))
  (=>
  (= (to_rep (rec__dimensions__vector_type__dx (us_split_fields5 c46b))) o14)
  (forall ((o15 Float64))
  (=>
  (= (to_rep (rec__dimensions__vector_type__dx (us_split_fields5 c46b))) o15)
  (fp.isFinite64 (fp.mul RNE o15 o14))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
