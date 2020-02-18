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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (positive positive) Bool)

(declare-const dummy positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range
                                    temp___expr_46)))

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

(declare-fun user_eq1 (float__ float__) Bool)

(declare-fun attr__ATTRIBUTE_IMAGE1 (Float32) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Float32)

(declare-const dummy1 float__)

(declare-datatypes ((float____ref 0))
(((float____refqtmk (float____content float__)))))
(define-fun float____ref_float____content__projection ((a float____ref)) float__ 
  (float____content a))

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

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__untangle_tests__coordinate__x float__)(rec__untangle_tests__coordinate__y float__)(rec__untangle_tests__coordinate__z float__)(rec__untangle_tests__coordinate__w float__)))))
(define-fun us_split_fields_rec__untangle_tests__coordinate__x__projection ((a us_split_fields)) float__ 
  (rec__untangle_tests__coordinate__x a))

(define-fun us_split_fields_rec__untangle_tests__coordinate__y__projection ((a us_split_fields)) float__ 
  (rec__untangle_tests__coordinate__y a))

(define-fun us_split_fields_rec__untangle_tests__coordinate__z__projection ((a us_split_fields)) float__ 
  (rec__untangle_tests__coordinate__z a))

(define-fun us_split_fields_rec__untangle_tests__coordinate__w__projection ((a us_split_fields)) float__ 
  (rec__untangle_tests__coordinate__w a))

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
                        (and
                        (fp.eq (to_rep
                               (rec__untangle_tests__coordinate__x
                               (us_split_fields1 a))) (to_rep
                                                      (rec__untangle_tests__coordinate__x
                                                      (us_split_fields1 b))))
                        (fp.eq (to_rep
                               (rec__untangle_tests__coordinate__y
                               (us_split_fields1 a))) (to_rep
                                                      (rec__untangle_tests__coordinate__y
                                                      (us_split_fields1 b)))))
                        (and
                        (fp.eq (to_rep
                               (rec__untangle_tests__coordinate__z
                               (us_split_fields1 a))) (to_rep
                                                      (rec__untangle_tests__coordinate__z
                                                      (us_split_fields1 b))))
                        (fp.eq (to_rep
                               (rec__untangle_tests__coordinate__w
                               (us_split_fields1 a))) (to_rep
                                                      (rec__untangle_tests__coordinate__w
                                                      (us_split_fields1 b))))))
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

(declare-const untangle_tests__coordinate__x__first__bit Int)

(declare-const untangle_tests__coordinate__x__last__bit Int)

(declare-const untangle_tests__coordinate__x__position Int)

;; untangle_tests__coordinate__x__first__bit_axiom
  (assert (<= 0 untangle_tests__coordinate__x__first__bit))

;; untangle_tests__coordinate__x__last__bit_axiom
  (assert
  (< untangle_tests__coordinate__x__first__bit untangle_tests__coordinate__x__last__bit))

;; untangle_tests__coordinate__x__position_axiom
  (assert (<= 0 untangle_tests__coordinate__x__position))

(declare-const untangle_tests__coordinate__y__first__bit Int)

(declare-const untangle_tests__coordinate__y__last__bit Int)

(declare-const untangle_tests__coordinate__y__position Int)

;; untangle_tests__coordinate__y__first__bit_axiom
  (assert (<= 0 untangle_tests__coordinate__y__first__bit))

;; untangle_tests__coordinate__y__last__bit_axiom
  (assert
  (< untangle_tests__coordinate__y__first__bit untangle_tests__coordinate__y__last__bit))

;; untangle_tests__coordinate__y__position_axiom
  (assert (<= 0 untangle_tests__coordinate__y__position))

(declare-const untangle_tests__coordinate__z__first__bit Int)

(declare-const untangle_tests__coordinate__z__last__bit Int)

(declare-const untangle_tests__coordinate__z__position Int)

;; untangle_tests__coordinate__z__first__bit_axiom
  (assert (<= 0 untangle_tests__coordinate__z__first__bit))

;; untangle_tests__coordinate__z__last__bit_axiom
  (assert
  (< untangle_tests__coordinate__z__first__bit untangle_tests__coordinate__z__last__bit))

;; untangle_tests__coordinate__z__position_axiom
  (assert (<= 0 untangle_tests__coordinate__z__position))

(declare-const untangle_tests__coordinate__w__first__bit Int)

(declare-const untangle_tests__coordinate__w__last__bit Int)

(declare-const untangle_tests__coordinate__w__position Int)

;; untangle_tests__coordinate__w__first__bit_axiom
  (assert (<= 0 untangle_tests__coordinate__w__first__bit))

;; untangle_tests__coordinate__w__last__bit_axiom
  (assert
  (< untangle_tests__coordinate__w__first__bit untangle_tests__coordinate__w__last__bit))

;; untangle_tests__coordinate__w__position_axiom
  (assert (<= 0 untangle_tests__coordinate__w__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((coordinate__ref 0))
(((coordinate__refqtmk (coordinate__content us_rep)))))
(define-fun coordinate__ref_coordinate__content__projection ((a coordinate__ref)) us_rep 
  (coordinate__content a))

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

(declare-const dummy3 (Array Int us_rep))

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

(declare-fun user_eq3 ((Array Int us_rep) (Array Int us_rep)) Bool)

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__untangle_tests__triangle__vertices (Array Int us_rep))(rec__untangle_tests__triangle__normal us_rep)))))
(define-fun us_split_fields_rec__untangle_tests__triangle__vertices__projection ((a us_split_fields2)) (Array Int us_rep) 
  (rec__untangle_tests__triangle__vertices a))

(define-fun us_split_fields_rec__untangle_tests__triangle__normal__projection ((a us_split_fields2)) us_rep 
  (rec__untangle_tests__triangle__normal a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq2 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (bool_eq1
                            (rec__untangle_tests__triangle__vertices
                            (us_split_fields3 a)) 1 3
                            (rec__untangle_tests__triangle__vertices
                            (us_split_fields3 b)) 1 3) true)
                         (= (bool_eq
                            (rec__untangle_tests__triangle__normal
                            (us_split_fields3 a))
                            (rec__untangle_tests__triangle__normal
                            (us_split_fields3 b))) true))
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

(declare-const untangle_tests__triangle__vertices__first__bit Int)

(declare-const untangle_tests__triangle__vertices__last__bit Int)

(declare-const untangle_tests__triangle__vertices__position Int)

;; untangle_tests__triangle__vertices__first__bit_axiom
  (assert (<= 0 untangle_tests__triangle__vertices__first__bit))

;; untangle_tests__triangle__vertices__last__bit_axiom
  (assert
  (< untangle_tests__triangle__vertices__first__bit untangle_tests__triangle__vertices__last__bit))

;; untangle_tests__triangle__vertices__position_axiom
  (assert (<= 0 untangle_tests__triangle__vertices__position))

(declare-const untangle_tests__triangle__normal__first__bit Int)

(declare-const untangle_tests__triangle__normal__last__bit Int)

(declare-const untangle_tests__triangle__normal__position Int)

;; untangle_tests__triangle__normal__first__bit_axiom
  (assert (<= 0 untangle_tests__triangle__normal__first__bit))

;; untangle_tests__triangle__normal__last__bit_axiom
  (assert
  (< untangle_tests__triangle__normal__first__bit untangle_tests__triangle__normal__last__bit))

;; untangle_tests__triangle__normal__position_axiom
  (assert (<= 0 untangle_tests__triangle__normal__position))

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ((triangle__ref 0))
(((triangle__refqtmk (triangle__content us_rep1)))))
(define-fun triangle__ref_triangle__content__projection ((a triangle__ref)) us_rep1 
  (triangle__content a))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int us_rep1))))))
(declare-fun slide1 ((Array Int us_rep1) Int Int) (Array Int us_rep1))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep1)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep1)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq3 ((a (Array Int us_rep1)) (a__first Int) (a__last Int)
  (b (Array Int us_rep1)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (bool_eq2 (select a temp___idx_155)
                              (select b (+ (- b__first a__first) temp___idx_155))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep1)) (b (Array Int us_rep1)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq3 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (bool_eq2 (select a temp___idx_155)
     (select b (+ (- b__first a__first) temp___idx_155))) true))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const a Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const b Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort ttriangle_listD1 0)

(declare-fun ttriangle_listD1qtint (ttriangle_listD1) Int)

;; ttriangle_listD1'axiom
  (assert
  (forall ((i ttriangle_listD1))
  (and (<= 1 (ttriangle_listD1qtint i)) (<= (ttriangle_listD1qtint i) 100))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq5 (ttriangle_listD1 ttriangle_listD1) Bool)

(declare-const dummy5 ttriangle_listD1)

(declare-datatypes ((ttriangle_listD1__ref 0))
(((ttriangle_listD1__refqtmk (ttriangle_listD1__content ttriangle_listD1)))))
(define-fun ttriangle_listD1__ref_ttriangle_listD1__content__projection ((a1 ttriangle_listD1__ref)) ttriangle_listD1 
  (ttriangle_listD1__content a1))

(define-fun dynamic_invariant1 ((temp___expr_60 Float32)
  (temp___is_init_56 Bool) (temp___skip_constant_57 Bool)
  (temp___do_toplevel_58 Bool)
  (temp___do_typ_inv_59 Bool)) Bool (=>
                                    (or (= temp___is_init_56 true)
                                    (fp.leq (fp.neg (fp #b0 #b11111110 #b11111111111111111111111)) (fp #b0 #b11111110 #b11111111111111111111111)))
                                    (fp.isFinite32 temp___expr_60)))

(assert
;; defqtvc
 ;; File "untangle_tests.adb", line 34, characters 0-0
  (not
  (=> (dynamic_invariant a true false true true)
  (=> (dynamic_invariant b true false true true) (<= 1 a)))))
(check-sat)