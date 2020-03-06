;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite32 ((x Float32)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral32 ((x Float32)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-const a Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort enum 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (enum enum) Bool)

(declare-const dummy enum)

(declare-datatypes () ((enum__ref (enum__refqtmk (enum__content enum)))))
(define-fun enum__ref_enum__content__projection ((a1 enum__ref)) enum 
  (enum__content a1))

(declare-fun to_rep (enum) Int)

(declare-fun of_rep (Int) enum)

;; inversion_axiom
  (assert
  (forall ((x enum)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x enum)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-fun pow2 (Int) Int)

(define-fun is_plus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float32)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float32)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

(declare-fun of_int (RoundingMode Int) Float32)

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

(declare-datatypes () ((t__ref (t__refqtmk (t__content Float32)))))
(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a1 integer__ref)) integer 
  (integer__content a1))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort float__ 0)

(declare-fun user_eq2 (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE3 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Float32)

(declare-const dummy2 float__)

(declare-datatypes ()
((float____ref (float____refqtmk (float____content float__)))))
(define-fun float____ref_float____content__projection ((a1 float____ref)) float__ 
  (float____content a1))

(declare-fun to_rep2 (float__) Float32)

(declare-fun of_rep2 (Float32) float__)

;; inversion_axiom
  (assert
  (forall ((x float__))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x float__))
  (! (fp.isFinite32 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Float32))
  (! (=> (fp.isFinite32 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                                  (of_rep2 x))) )))

(declare-sort sub_enum 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (sub_enum sub_enum) Bool)

(declare-const dummy3 sub_enum)

(declare-datatypes ()
((sub_enum__ref (sub_enum__refqtmk (sub_enum__content sub_enum)))))
(define-fun sub_enum__ref_sub_enum__content__projection ((a1 sub_enum__ref)) sub_enum 
  (sub_enum__content a1))

(declare-fun to_rep3 (sub_enum) Int)

(declare-fun of_rep3 (Int) sub_enum)

;; inversion_axiom
  (assert
  (forall ((x sub_enum))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x sub_enum)) (! (in_range3 (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-datatypes ()
((us_split_discrs (us_split_discrsqtmk (rec__rec__my_rec__e sub_enum)))))
(define-fun us_split_discrs_rec__rec__my_rec__e__projection ((a1 us_split_discrs)) sub_enum 
  (rec__rec__my_rec__e a1))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a1 us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a1))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__rec__my_rec__x integer)(rec__rec__my_rec__y float__)))))
(define-fun us_split_fields_rec__rec__my_rec__x__projection ((a1 us_split_fields)) integer 
  (rec__rec__my_rec__x a1))

(define-fun us_split_fields_rec__rec__my_rec__y__projection ((a1 us_split_fields)) float__ 
  (rec__rec__my_rec__y a1))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a1 us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a1))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a1 us_rep)) us_split_discrs 
  (us_split_discrs1 a1))

(define-fun us_rep___split_fields__projection ((a1 us_rep)) us_split_fields 
  (us_split_fields1 a1))

(define-fun rec__my_rec__x__pred ((a1 us_rep)) Bool (= (to_rep3
                                                       (rec__rec__my_rec__e
                                                       (us_split_discrs1 a1))) 0))

(define-fun rec__my_rec__y__pred ((a1 us_rep)) Bool (= (to_rep3
                                                       (rec__rec__my_rec__e
                                                       (us_split_discrs1 a1))) 1))

(define-fun bool_eq ((a1 us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep3
                           (rec__rec__my_rec__e (us_split_discrs1 a1))) 
                        (to_rep3 (rec__rec__my_rec__e (us_split_discrs1 b))))
                        (and
                        (=> (rec__my_rec__x__pred a1)
                        (= (to_rep1
                           (rec__rec__my_rec__x (us_split_fields1 a1))) 
                        (to_rep1 (rec__rec__my_rec__x (us_split_fields1 b)))))
                        (=> (rec__my_rec__y__pred a1)
                        (fp.eq (to_rep2
                               (rec__rec__my_rec__y (us_split_fields1 a1))) 
                        (to_rep2 (rec__rec__my_rec__y (us_split_fields1 b)))))))
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

(declare-const rec__my_rec__e__first__bit Int)

(declare-const rec__my_rec__e__last__bit Int)

(declare-const rec__my_rec__e__position Int)

;; rec__my_rec__e__first__bit_axiom
  (assert (<= 0 rec__my_rec__e__first__bit))

;; rec__my_rec__e__last__bit_axiom
  (assert (< rec__my_rec__e__first__bit rec__my_rec__e__last__bit))

;; rec__my_rec__e__position_axiom
  (assert (<= 0 rec__my_rec__e__position))

(declare-const rec__my_rec__x__first__bit Int)

(declare-const rec__my_rec__x__last__bit Int)

(declare-const rec__my_rec__x__position Int)

;; rec__my_rec__x__first__bit_axiom
  (assert (<= 0 rec__my_rec__x__first__bit))

;; rec__my_rec__x__last__bit_axiom
  (assert (< rec__my_rec__x__first__bit rec__my_rec__x__last__bit))

;; rec__my_rec__x__position_axiom
  (assert (<= 0 rec__my_rec__x__position))

(declare-const rec__my_rec__y__first__bit Int)

(declare-const rec__my_rec__y__last__bit Int)

(declare-const rec__my_rec__y__position Int)

;; rec__my_rec__y__first__bit_axiom
  (assert (<= 0 rec__my_rec__y__first__bit))

;; rec__my_rec__y__last__bit_axiom
  (assert (< rec__my_rec__y__first__bit rec__my_rec__y__last__bit))

;; rec__my_rec__y__position_axiom
  (assert (<= 0 rec__my_rec__y__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes () ((t2s__ref (t2s__refqtmk (t2s__content us_rep)))))
(define-fun t2s__ref_t2s__content__projection ((a1 t2s__ref)) us_rep 
  (t2s__content a1))

(declare-datatypes ()
((us_split_discrs2 (us_split_discrsqtmk1 (rec__rec__sub_rec_ok__z enum)))))
(define-fun us_split_discrs_rec__rec__sub_rec_ok__z__projection ((a1 us_split_discrs2)) enum 
  (rec__rec__sub_rec_ok__z a1))

(declare-datatypes ()
((us_split_discrs__ref1
 (us_split_discrs__refqtmk1 (us_split_discrs__content1 us_split_discrs2)))))
(define-fun us_split_discrs__ref___split_discrs__content__3__projection ((a1 us_split_discrs__ref1)) us_split_discrs2 
  (us_split_discrs__content1 a1))

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1 (rec__rec__sub_rec_ok__plop us_rep)))))
(define-fun us_split_fields_rec__rec__sub_rec_ok__plop__projection ((a1 us_split_fields2)) us_rep 
  (rec__rec__sub_rec_ok__plop a1))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__4__projection ((a1 us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a1))

(declare-datatypes ()
((us_rep1
 (us_repqtmk1
 (us_split_discrs3 us_split_discrs2)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__4__projection ((a1 us_rep1)) us_split_discrs2 
  (us_split_discrs3 a1))

(define-fun us_rep___split_fields__4__projection ((a1 us_rep1)) us_split_fields2 
  (us_split_fields3 a1))

(define-fun rec__sub_rec_ok__plop__pred ((a1 us_rep1)) Bool (and
                                                            (<= 0 (to_rep
                                                                  (rec__rec__sub_rec_ok__z
                                                                  (us_split_discrs3
                                                                  a1))))
                                                            (<= (to_rep
                                                                (rec__rec__sub_rec_ok__z
                                                                (us_split_discrs3
                                                                a1))) 1)))

(define-fun bool_eq1 ((a1 us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__rec__sub_rec_ok__z (us_split_discrs3 a1))) 
                         (to_rep
                         (rec__rec__sub_rec_ok__z (us_split_discrs3 b))))
                         (=> (rec__sub_rec_ok__plop__pred a1)
                         (= (bool_eq
                            (rec__rec__sub_rec_ok__plop
                            (us_split_fields3 a1))
                            (rec__rec__sub_rec_ok__plop (us_split_fields3 b))) true)))
                    true false))

(define-fun in_range4 ((rec__rec__sub_rec_ok__z1 Int)
  (a1 us_split_discrs2)) Bool (= rec__rec__sub_rec_ok__z1 (to_rep
                                                          (rec__rec__sub_rec_ok__z
                                                          a1))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const rec__sub_rec_ok__z__first__bit Int)

(declare-const rec__sub_rec_ok__z__last__bit Int)

(declare-const rec__sub_rec_ok__z__position Int)

;; rec__sub_rec_ok__z__first__bit_axiom
  (assert (<= 0 rec__sub_rec_ok__z__first__bit))

;; rec__sub_rec_ok__z__last__bit_axiom
  (assert (< rec__sub_rec_ok__z__first__bit rec__sub_rec_ok__z__last__bit))

;; rec__sub_rec_ok__z__position_axiom
  (assert (<= 0 rec__sub_rec_ok__z__position))

(declare-const rec__sub_rec_ok__plop__first__bit Int)

(declare-const rec__sub_rec_ok__plop__last__bit Int)

(declare-const rec__sub_rec_ok__plop__position Int)

;; rec__sub_rec_ok__plop__first__bit_axiom
  (assert (<= 0 rec__sub_rec_ok__plop__first__bit))

;; rec__sub_rec_ok__plop__last__bit_axiom
  (assert
  (< rec__sub_rec_ok__plop__first__bit rec__sub_rec_ok__plop__last__bit))

;; rec__sub_rec_ok__plop__position_axiom
  (assert (<= 0 rec__sub_rec_ok__plop__position))

(declare-fun user_eq5 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ()
((sub_rec_ok__ref (sub_rec_ok__refqtmk (sub_rec_ok__content us_rep1)))))
(define-fun sub_rec_ok__ref_sub_rec_ok__content__projection ((a1 sub_rec_ok__ref)) us_rep1 
  (sub_rec_ok__content a1))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const rec__my_rec__e__first__bit1 Int)

(declare-const rec__my_rec__e__last__bit1 Int)

(declare-const rec__my_rec__e__position1 Int)

;; rec__my_rec__e__first__bit_axiom
  (assert (<= 0 rec__my_rec__e__first__bit1))

;; rec__my_rec__e__last__bit_axiom
  (assert (< rec__my_rec__e__first__bit1 rec__my_rec__e__last__bit1))

;; rec__my_rec__e__position_axiom
  (assert (<= 0 rec__my_rec__e__position1))

(declare-const rec__my_rec__x__first__bit1 Int)

(declare-const rec__my_rec__x__last__bit1 Int)

(declare-const rec__my_rec__x__position1 Int)

;; rec__my_rec__x__first__bit_axiom
  (assert (<= 0 rec__my_rec__x__first__bit1))

;; rec__my_rec__x__last__bit_axiom
  (assert (< rec__my_rec__x__first__bit1 rec__my_rec__x__last__bit1))

;; rec__my_rec__x__position_axiom
  (assert (<= 0 rec__my_rec__x__position1))

(declare-const rec__my_rec__y__first__bit1 Int)

(declare-const rec__my_rec__y__last__bit1 Int)

(declare-const rec__my_rec__y__position1 Int)

;; rec__my_rec__y__first__bit_axiom
  (assert (<= 0 rec__my_rec__y__first__bit1))

;; rec__my_rec__y__last__bit_axiom
  (assert (< rec__my_rec__y__first__bit1 rec__my_rec__y__last__bit1))

;; rec__my_rec__y__position_axiom
  (assert (<= 0 rec__my_rec__y__position1))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes () ((t5b__ref (t5b__refqtmk (t5b__content us_rep)))))
(define-fun t5b__ref_t5b__content__projection ((a1 t5b__ref)) us_rep 
  (t5b__content a1))

(declare-datatypes ()
((us_split_fields4
 (us_split_fieldsqtmk2 (rec__rec__sub_rec_ok__plop1 us_rep)))))
(define-fun us_split_fields_rec__rec__sub_rec_ok__plop__2__projection ((a1 us_split_fields4)) us_rep 
  (rec__rec__sub_rec_ok__plop1 a1))

(declare-datatypes ()
((us_split_fields__ref2
 (us_split_fields__refqtmk2 (us_split_fields__content2 us_split_fields4)))))
(define-fun us_split_fields__ref___split_fields__content__5__projection ((a1 us_split_fields__ref2)) us_split_fields4 
  (us_split_fields__content2 a1))

(declare-datatypes ()
((us_rep2
 (us_repqtmk2
 (us_split_discrs4 us_split_discrs2)(us_split_fields5 us_split_fields4)))))
(define-fun us_rep___split_discrs__5__projection ((a1 us_rep2)) us_split_discrs2 
  (us_split_discrs4 a1))

(define-fun us_rep___split_fields__5__projection ((a1 us_rep2)) us_split_fields4 
  (us_split_fields5 a1))

(define-fun to_base ((a1 us_rep2)) us_rep1 (us_repqtmk1 (us_split_discrs4 a1)
                                           (us_split_fieldsqtmk1
                                           (rec__rec__sub_rec_ok__plop1
                                           (us_split_fields5 a1)))))

(define-fun of_base ((r us_rep1)) us_rep2 (us_repqtmk2 (us_split_discrs3 r)
                                          (us_split_fieldsqtmk2
                                          (rec__rec__sub_rec_ok__plop
                                          (us_split_fields3 r)))))

(define-fun rec__sub_rec_ok__plop__pred1 ((a1 us_rep2)) Bool (and
                                                             (<= 0 (to_rep
                                                                   (rec__rec__sub_rec_ok__z
                                                                   (us_split_discrs4
                                                                   a1))))
                                                             (<= (to_rep
                                                                 (rec__rec__sub_rec_ok__z
                                                                 (us_split_discrs4
                                                                 a1))) 1)))

(define-fun bool_eq2 ((a1 us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (to_rep
                            (rec__rec__sub_rec_ok__z (us_split_discrs4 a1))) 
                         (to_rep
                         (rec__rec__sub_rec_ok__z (us_split_discrs4 b))))
                         (=> (rec__sub_rec_ok__plop__pred1 a1)
                         (= (bool_eq
                            (rec__rec__sub_rec_ok__plop1
                            (us_split_fields5 a1))
                            (rec__rec__sub_rec_ok__plop1
                            (us_split_fields5 b))) true)))
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

(declare-const rec__sub_rec_ok__z__first__bit1 Int)

(declare-const rec__sub_rec_ok__z__last__bit1 Int)

(declare-const rec__sub_rec_ok__z__position1 Int)

;; rec__sub_rec_ok__z__first__bit_axiom
  (assert (<= 0 rec__sub_rec_ok__z__first__bit1))

;; rec__sub_rec_ok__z__last__bit_axiom
  (assert (< rec__sub_rec_ok__z__first__bit1 rec__sub_rec_ok__z__last__bit1))

;; rec__sub_rec_ok__z__position_axiom
  (assert (<= 0 rec__sub_rec_ok__z__position1))

(declare-const rec__sub_rec_ok__plop__first__bit1 Int)

(declare-const rec__sub_rec_ok__plop__last__bit1 Int)

(declare-const rec__sub_rec_ok__plop__position1 Int)

;; rec__sub_rec_ok__plop__first__bit_axiom
  (assert (<= 0 rec__sub_rec_ok__plop__first__bit1))

;; rec__sub_rec_ok__plop__last__bit_axiom
  (assert
  (< rec__sub_rec_ok__plop__first__bit1 rec__sub_rec_ok__plop__last__bit1))

;; rec__sub_rec_ok__plop__position_axiom
  (assert (<= 0 rec__sub_rec_ok__plop__position1))

(declare-fun user_eq7 (us_rep2 us_rep2) Bool)

(declare-const dummy7 us_rep2)

(declare-datatypes () ((tzS__ref (tzS__refqtmk (tzS__content us_rep2)))))
(define-fun tzS__ref_tzS__content__2__projection ((a1 tzS__ref)) us_rep2 
  (tzS__content a1))

(declare-const z__split_discrs us_split_discrs2)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun in_range5 ((rec__rec__my_rec__e1 Int)
  (a1 us_split_discrs)) Bool (= rec__rec__my_rec__e1 (to_rep3
                                                     (rec__rec__my_rec__e a1))))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-const rec__my_rec__e__first__bit2 Int)

(declare-const rec__my_rec__e__last__bit2 Int)

(declare-const rec__my_rec__e__position2 Int)

;; rec__my_rec__e__first__bit_axiom
  (assert (<= 0 rec__my_rec__e__first__bit2))

;; rec__my_rec__e__last__bit_axiom
  (assert (< rec__my_rec__e__first__bit2 rec__my_rec__e__last__bit2))

;; rec__my_rec__e__position_axiom
  (assert (<= 0 rec__my_rec__e__position2))

(declare-const rec__my_rec__x__first__bit2 Int)

(declare-const rec__my_rec__x__last__bit2 Int)

(declare-const rec__my_rec__x__position2 Int)

;; rec__my_rec__x__first__bit_axiom
  (assert (<= 0 rec__my_rec__x__first__bit2))

;; rec__my_rec__x__last__bit_axiom
  (assert (< rec__my_rec__x__first__bit2 rec__my_rec__x__last__bit2))

;; rec__my_rec__x__position_axiom
  (assert (<= 0 rec__my_rec__x__position2))

(declare-const rec__my_rec__y__first__bit2 Int)

(declare-const rec__my_rec__y__last__bit2 Int)

(declare-const rec__my_rec__y__position2 Int)

;; rec__my_rec__y__first__bit_axiom
  (assert (<= 0 rec__my_rec__y__first__bit2))

;; rec__my_rec__y__last__bit_axiom
  (assert (< rec__my_rec__y__first__bit2 rec__my_rec__y__last__bit2))

;; rec__my_rec__y__position_axiom
  (assert (<= 0 rec__my_rec__y__position2))

(declare-fun user_eq8 (us_rep us_rep) Bool)

(declare-const dummy8 us_rep)

(declare-datatypes ()
((my_rec__ref (my_rec__refqtmk (my_rec__content us_rep)))))
(define-fun my_rec__ref_my_rec__content__projection ((a1 my_rec__ref)) us_rep 
  (my_rec__content a1))

(define-fun dynamic_invariant ((temp___expr_233 us_rep2)
  (temp___is_init_229 Bool) (temp___skip_constant_230 Bool)
  (temp___do_toplevel_231 Bool)
  (temp___do_typ_inv_232 Bool)) Bool (and
                                     (=>
                                     (not (= temp___skip_constant_230 true))
                                     (in_range4 a
                                     (us_split_discrs3
                                     (to_base temp___expr_233))))
                                     (=> (rec__sub_rec_ok__plop__pred1
                                     temp___expr_233) (in_range5 a
                                     (us_split_discrs1
                                     (rec__rec__sub_rec_ok__plop1
                                     (us_split_fields5 temp___expr_233)))))))

(define-fun default_initial_assumption ((temp___expr_236 us_rep2)
  (temp___skip_top_level_237 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__rec__sub_rec_ok__z
                                            (us_split_discrs4
                                            temp___expr_236))) a)
                                         (=> (rec__sub_rec_ok__plop__pred1
                                         temp___expr_236)
                                         (= (to_rep3
                                            (rec__rec__my_rec__e
                                            (us_split_discrs1
                                            (rec__rec__sub_rec_ok__plop1
                                            (us_split_fields5
                                            temp___expr_236))))) a))))

(define-fun dynamic_invariant1 ((temp___expr_185 Int)
  (temp___is_init_181 Bool) (temp___skip_constant_182 Bool)
  (temp___do_toplevel_183 Bool)
  (temp___do_typ_inv_184 Bool)) Bool (=>
                                     (or (= temp___is_init_181 true)
                                     (<= 0 2)) (in_range1 temp___expr_185)))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

(define-fun dynamic_invariant3 ((temp___expr_60 Float32)
  (temp___is_init_56 Bool) (temp___skip_constant_57 Bool)
  (temp___do_toplevel_58 Bool)
  (temp___do_typ_inv_59 Bool)) Bool (=>
                                    (or (= temp___is_init_56 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                    (fp.isFinite32 temp___expr_60)))

(define-fun dynamic_invariant4 ((temp___expr_192 Int)
  (temp___is_init_188 Bool) (temp___skip_constant_189 Bool)
  (temp___do_toplevel_190 Bool)
  (temp___do_typ_inv_191 Bool)) Bool (=>
                                     (or (= temp___is_init_188 true)
                                     (<= 0 1)) (in_range3 temp___expr_192)))

(define-fun dynamic_invariant5 ((temp___expr_226 us_rep1)
  (temp___is_init_222 Bool) (temp___skip_constant_223 Bool)
  (temp___do_toplevel_224 Bool)
  (temp___do_typ_inv_225 Bool)) Bool (=> (rec__sub_rec_ok__plop__pred
                                     temp___expr_226) (in_range5
                                     (to_rep
                                     (rec__rec__sub_rec_ok__z
                                     (us_split_discrs3 temp___expr_226)))
                                     (us_split_discrs1
                                     (rec__rec__sub_rec_ok__plop
                                     (us_split_fields3 temp___expr_226))))))

;; Assume
  (assert (dynamic_invariant1 a true false true true))

(define-fun o () Int a)

(assert
;; defqtvc
 ;; File "main.adb", line 14, characters 0-0
  (not (in_range1 o)))
(check-sat)