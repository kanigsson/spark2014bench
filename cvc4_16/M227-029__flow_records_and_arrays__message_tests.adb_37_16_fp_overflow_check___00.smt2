;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite32 ((x Float32)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral32 ((x Float32)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
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

(define-fun is_plus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float32)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float32)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

(declare-const max_int Int)

(define-fun in_int_range ((i Int)) Bool (and (<= (- max_int) i)
                                        (<= i max_int)))

(define-fun in_safe_int_range ((i Int)) Bool (and (<= (- 16777216) i)
                                             (<= i 16777216)))

(define-fun same_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isPositive y))
                    (and (fp.isNegative x) (fp.isNegative y))))

(define-fun diff_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isNegative y))
                    (and (fp.isNegative x) (fp.isPositive y))))

(define-fun product_sign ((z Float32) (x Float32)
  (y Float32)) Bool (and (=> (same_sign x y) (fp.isPositive z))
                    (=> (diff_sign x y) (fp.isNegative z))))

(define-fun sqr ((x Real)) Real (* x x))

(declare-fun sqrt1 (Real) Real)

(define-fun same_sign_real ((x Float32)
  (r Real)) Bool (or (and (fp.isPositive x) (< 0.0 r))
                 (and (fp.isNegative x) (< r 0.0))))

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content Float32)))))
(declare-sort float__ 0)

(declare-fun user_eq (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Float32)

(declare-const dummy float__)

(declare-datatypes ((float____ref 0))
(((float____refqtmk (float____content float__)))))
(define-fun float____ref_float____content__projection ((a float____ref)) float__ 
  (float____content a))

(define-fun dynamic_invariant ((temp___expr_60 Float32)
  (temp___is_init_56 Bool) (temp___skip_constant_57 Bool)
  (temp___do_toplevel_58 Bool)
  (temp___do_typ_inv_59 Bool)) Bool (=>
                                    (or (= temp___is_init_56 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                    (fp.isFinite32 temp___expr_60)))

(declare-fun to_rep (float__) Float32)

(declare-fun of_rep (Float32) float__)

;; inversion_axiom
  (assert
  (forall ((x float__)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x float__))
  (! (fp.isFinite32 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Float32))
  (! (=> (fp.isFinite32 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                                (of_rep x))) )))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__message_tests__flags_t__a Bool)(rec__message_tests__flags_t__b Bool)))))
(define-fun us_split_fields_rec__message_tests__flags_t__a__projection ((a us_split_fields)) Bool 
  (rec__message_tests__flags_t__a a))

(define-fun us_split_fields_rec__message_tests__flags_t__b__projection ((a us_split_fields)) Bool 
  (rec__message_tests__flags_t__b a))

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
                        (= (ite (rec__message_tests__flags_t__a
                                (us_split_fields1 a)) 1 0) (ite (rec__message_tests__flags_t__a
                                                                (us_split_fields1
                                                                b)) 1 0))
                        (= (ite (rec__message_tests__flags_t__b
                                (us_split_fields1 a)) 1 0) (ite (rec__message_tests__flags_t__b
                                                                (us_split_fields1
                                                                b)) 1 0)))
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

(declare-const message_tests__flags_t__a__first__bit Int)

(declare-const message_tests__flags_t__a__last__bit Int)

(declare-const message_tests__flags_t__a__position Int)

;; message_tests__flags_t__a__first__bit_axiom
  (assert (<= 0 message_tests__flags_t__a__first__bit))

;; message_tests__flags_t__a__last__bit_axiom
  (assert
  (< message_tests__flags_t__a__first__bit message_tests__flags_t__a__last__bit))

;; message_tests__flags_t__a__position_axiom
  (assert (<= 0 message_tests__flags_t__a__position))

(declare-const message_tests__flags_t__b__first__bit Int)

(declare-const message_tests__flags_t__b__last__bit Int)

(declare-const message_tests__flags_t__b__position Int)

;; message_tests__flags_t__b__first__bit_axiom
  (assert (<= 0 message_tests__flags_t__b__first__bit))

;; message_tests__flags_t__b__last__bit_axiom
  (assert
  (< message_tests__flags_t__b__first__bit message_tests__flags_t__b__last__bit))

;; message_tests__flags_t__b__position_axiom
  (assert (<= 0 message_tests__flags_t__b__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((flags_t__ref 0))
(((flags_t__refqtmk (flags_t__content us_rep)))))
(define-fun flags_t__ref_flags_t__content__projection ((a flags_t__ref)) us_rep 
  (flags_t__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__message_tests__coordinate__x float__)(rec__message_tests__coordinate__y float__)(rec__message_tests__coordinate__w float__)(rec__message_tests__coordinate__flags us_rep)))))
(define-fun us_split_fields_rec__message_tests__coordinate__x__projection ((a us_split_fields2)) float__ 
  (rec__message_tests__coordinate__x a))

(define-fun us_split_fields_rec__message_tests__coordinate__y__projection ((a us_split_fields2)) float__ 
  (rec__message_tests__coordinate__y a))

(define-fun us_split_fields_rec__message_tests__coordinate__w__projection ((a us_split_fields2)) float__ 
  (rec__message_tests__coordinate__w a))

(define-fun us_split_fields_rec__message_tests__coordinate__flags__projection ((a us_split_fields2)) us_rep 
  (rec__message_tests__coordinate__flags a))

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
                         (and
                         (fp.eq (to_rep
                                (rec__message_tests__coordinate__x
                                (us_split_fields3 a))) (to_rep
                                                       (rec__message_tests__coordinate__x
                                                       (us_split_fields3 b))))
                         (fp.eq (to_rep
                                (rec__message_tests__coordinate__y
                                (us_split_fields3 a))) (to_rep
                                                       (rec__message_tests__coordinate__y
                                                       (us_split_fields3 b)))))
                         (and
                         (fp.eq (to_rep
                                (rec__message_tests__coordinate__w
                                (us_split_fields3 a))) (to_rep
                                                       (rec__message_tests__coordinate__w
                                                       (us_split_fields3 b))))
                         (= (bool_eq
                            (rec__message_tests__coordinate__flags
                            (us_split_fields3 a))
                            (rec__message_tests__coordinate__flags
                            (us_split_fields3 b))) true)))
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

(declare-const message_tests__coordinate__x__first__bit Int)

(declare-const message_tests__coordinate__x__last__bit Int)

(declare-const message_tests__coordinate__x__position Int)

;; message_tests__coordinate__x__first__bit_axiom
  (assert (<= 0 message_tests__coordinate__x__first__bit))

;; message_tests__coordinate__x__last__bit_axiom
  (assert
  (< message_tests__coordinate__x__first__bit message_tests__coordinate__x__last__bit))

;; message_tests__coordinate__x__position_axiom
  (assert (<= 0 message_tests__coordinate__x__position))

(declare-const message_tests__coordinate__y__first__bit Int)

(declare-const message_tests__coordinate__y__last__bit Int)

(declare-const message_tests__coordinate__y__position Int)

;; message_tests__coordinate__y__first__bit_axiom
  (assert (<= 0 message_tests__coordinate__y__first__bit))

;; message_tests__coordinate__y__last__bit_axiom
  (assert
  (< message_tests__coordinate__y__first__bit message_tests__coordinate__y__last__bit))

;; message_tests__coordinate__y__position_axiom
  (assert (<= 0 message_tests__coordinate__y__position))

(declare-const message_tests__coordinate__w__first__bit Int)

(declare-const message_tests__coordinate__w__last__bit Int)

(declare-const message_tests__coordinate__w__position Int)

;; message_tests__coordinate__w__first__bit_axiom
  (assert (<= 0 message_tests__coordinate__w__first__bit))

;; message_tests__coordinate__w__last__bit_axiom
  (assert
  (< message_tests__coordinate__w__first__bit message_tests__coordinate__w__last__bit))

;; message_tests__coordinate__w__position_axiom
  (assert (<= 0 message_tests__coordinate__w__position))

(declare-const message_tests__coordinate__flags__first__bit Int)

(declare-const message_tests__coordinate__flags__last__bit Int)

(declare-const message_tests__coordinate__flags__position Int)

;; message_tests__coordinate__flags__first__bit_axiom
  (assert (<= 0 message_tests__coordinate__flags__first__bit))

;; message_tests__coordinate__flags__last__bit_axiom
  (assert
  (< message_tests__coordinate__flags__first__bit message_tests__coordinate__flags__last__bit))

;; message_tests__coordinate__flags__position_axiom
  (assert (<= 0 message_tests__coordinate__flags__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((coordinate__ref 0))
(((coordinate__refqtmk (coordinate__content us_rep1)))))
(define-fun coordinate__ref_coordinate__content__projection ((a coordinate__ref)) us_rep1 
  (coordinate__content a))

(declare-const c us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(assert
;; defqtvc
 ;; File "message_tests.adb", line 32, characters 0-0
  (not
  (forall ((w Float32) (o Float32) (o1 Float32))
  (=> (dynamic_invariant w false false true true)
  (=> (= (to_rep (rec__message_tests__coordinate__y (us_split_fields3 c))) o)
  (=>
  (= (to_rep (rec__message_tests__coordinate__x (us_split_fields3 c))) o1)
  (fp.isFinite32 (fp.add RNE o1 o))))))))
(check-sat)