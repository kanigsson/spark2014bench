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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort gender_type 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (gender_type gender_type) Bool)

(declare-const dummy gender_type)

(declare-datatypes ((gender_type__ref 0))
(((gender_type__refqtmk (gender_type__content gender_type)))))
(define-fun gender_type__ref_gender_type__content__projection ((a gender_type__ref)) gender_type 
  (gender_type__content a))

(declare-fun to_rep (gender_type) Int)

(declare-fun of_rep (Int) gender_type)

;; inversion_axiom
  (assert
  (forall ((x gender_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x gender_type)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort meal_plan_type 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (meal_plan_type meal_plan_type) Bool)

(declare-const dummy1 meal_plan_type)

(declare-datatypes ((meal_plan_type__ref 0))
(((meal_plan_type__refqtmk (meal_plan_type__content meal_plan_type)))))
(define-fun meal_plan_type__ref_meal_plan_type__content__projection ((a meal_plan_type__ref)) meal_plan_type 
  (meal_plan_type__content a))

(declare-fun to_rep1 (meal_plan_type) Int)

(declare-fun of_rep1 (Int) meal_plan_type)

;; inversion_axiom
  (assert
  (forall ((x meal_plan_type))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x meal_plan_type)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort student_id 0)

(declare-fun student_idqtint (student_id) Int)

;; student_id'axiom
  (assert
  (forall ((i student_id))
  (and (<= 0 (student_idqtint i)) (<= (student_idqtint i) 999999))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 999999)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (student_id student_id) Bool)

(declare-const dummy2 student_id)

(declare-datatypes ((student_id__ref 0))
(((student_id__refqtmk (student_id__content student_id)))))
(define-fun student_id__ref_student_id__content__projection ((a student_id__ref)) student_id 
  (student_id__content a))

(define-fun to_rep2 ((x student_id)) Int (student_idqtint x))

(declare-fun of_rep2 (Int) student_id)

;; inversion_axiom
  (assert
  (forall ((x student_id))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x student_id)) (! (in_range3
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort gpa_type 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 512)))

(declare-const dummy3 gpa_type)

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (gpa_type gpa_type) Bool)

(declare-datatypes ((gpa_type__ref 0))
(((gpa_type__refqtmk (gpa_type__content gpa_type)))))
(define-fun gpa_type__ref_gpa_type__content__projection ((a gpa_type__ref)) gpa_type 
  (gpa_type__content a))

(declare-fun to_rep3 (gpa_type) Int)

(declare-fun of_rep3 (Int) gpa_type)

;; inversion_axiom
  (assert
  (forall ((x gpa_type))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x gpa_type)) (! (in_range4 (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-sort date 0)

(declare-fun dateqtint (date) Int)

;; date'axiom
  (assert
  (forall ((i date))
  (and (<= (- 2147483648) (dateqtint i)) (<= (dateqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq4 (date date) Bool)

(declare-const dummy4 date)

(declare-datatypes ((date__ref 0))
(((date__refqtmk (date__content date)))))
(define-fun date__ref_date__content__projection ((a date__ref)) date 
  (date__content a))

(define-fun to_rep4 ((x date)) Int (dateqtint x))

(declare-fun of_rep4 (Int) date)

;; inversion_axiom
  (assert
  (forall ((x date)) (! (= (of_rep4 (to_rep4 x)) x) :pattern ((to_rep4 x)) )))

;; range_axiom
  (assert
  (forall ((x date)) (! (in_range5 (to_rep4 x)) :pattern ((to_rep4 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range5 x) (= (to_rep4 (of_rep4 x)) x)) :pattern ((to_rep4
                                                              (of_rep4 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__students__student_record__birth_date date)(rec__students__student_record__id student_id)(rec__students__student_record__gender gender_type)(rec__students__student_record__gpa gpa_type)(rec__students__student_record__part_time Bool)(rec__students__student_record__in_state Bool)(rec__students__student_record__resident Bool)(rec__students__student_record__meal_plan meal_plan_type)(rec__students__student_record__self_insured Bool)))))
(define-fun us_split_fields_rec__students__student_record__birth_date__projection ((a us_split_fields)) date 
  (rec__students__student_record__birth_date a))

(define-fun us_split_fields_rec__students__student_record__id__projection ((a us_split_fields)) student_id 
  (rec__students__student_record__id a))

(define-fun us_split_fields_rec__students__student_record__gender__projection ((a us_split_fields)) gender_type 
  (rec__students__student_record__gender a))

(define-fun us_split_fields_rec__students__student_record__gpa__projection ((a us_split_fields)) gpa_type 
  (rec__students__student_record__gpa a))

(define-fun us_split_fields_rec__students__student_record__part_time__projection ((a us_split_fields)) Bool 
  (rec__students__student_record__part_time a))

(define-fun us_split_fields_rec__students__student_record__in_state__projection ((a us_split_fields)) Bool 
  (rec__students__student_record__in_state a))

(define-fun us_split_fields_rec__students__student_record__resident__projection ((a us_split_fields)) Bool 
  (rec__students__student_record__resident a))

(define-fun us_split_fields_rec__students__student_record__meal_plan__projection ((a us_split_fields)) meal_plan_type 
  (rec__students__student_record__meal_plan a))

(define-fun us_split_fields_rec__students__student_record__self_insured__projection ((a us_split_fields)) Bool 
  (rec__students__student_record__self_insured a))

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
                        (= (to_rep4
                           (rec__students__student_record__birth_date
                           (us_split_fields1 a))) (to_rep4
                                                  (rec__students__student_record__birth_date
                                                  (us_split_fields1 b))))
                        (= (to_rep2
                           (rec__students__student_record__id
                           (us_split_fields1 a))) (to_rep2
                                                  (rec__students__student_record__id
                                                  (us_split_fields1 b)))))
                        (and
                        (and
                        (and
                        (= (to_rep
                           (rec__students__student_record__gender
                           (us_split_fields1 a))) (to_rep
                                                  (rec__students__student_record__gender
                                                  (us_split_fields1 b))))
                        (= (to_rep3
                           (rec__students__student_record__gpa
                           (us_split_fields1 a))) (to_rep3
                                                  (rec__students__student_record__gpa
                                                  (us_split_fields1 b)))))
                        (and
                        (= (ite (rec__students__student_record__part_time
                                (us_split_fields1 a)) 1 0) (ite (rec__students__student_record__part_time
                                                                (us_split_fields1
                                                                b)) 1 0))
                        (= (ite (rec__students__student_record__in_state
                                (us_split_fields1 a)) 1 0) (ite (rec__students__student_record__in_state
                                                                (us_split_fields1
                                                                b)) 1 0))))
                        (and
                        (and
                        (= (ite (rec__students__student_record__resident
                                (us_split_fields1 a)) 1 0) (ite (rec__students__student_record__resident
                                                                (us_split_fields1
                                                                b)) 1 0))
                        (= (to_rep1
                           (rec__students__student_record__meal_plan
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__students__student_record__meal_plan
                                                  (us_split_fields1 b)))))
                        (= (ite (rec__students__student_record__self_insured
                                (us_split_fields1 a)) 1 0) (ite (rec__students__student_record__self_insured
                                                                (us_split_fields1
                                                                b)) 1 0)))))
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

(declare-const students__student_record__birth_date__first__bit Int)

(declare-const students__student_record__birth_date__last__bit Int)

(declare-const students__student_record__birth_date__position Int)

;; students__student_record__birth_date__first__bit_axiom
  (assert (<= 0 students__student_record__birth_date__first__bit))

;; students__student_record__birth_date__last__bit_axiom
  (assert
  (< students__student_record__birth_date__first__bit students__student_record__birth_date__last__bit))

;; students__student_record__birth_date__position_axiom
  (assert (<= 0 students__student_record__birth_date__position))

(declare-const students__student_record__id__first__bit Int)

(declare-const students__student_record__id__last__bit Int)

(declare-const students__student_record__id__position Int)

;; students__student_record__id__first__bit_axiom
  (assert (<= 0 students__student_record__id__first__bit))

;; students__student_record__id__last__bit_axiom
  (assert
  (< students__student_record__id__first__bit students__student_record__id__last__bit))

;; students__student_record__id__position_axiom
  (assert (<= 0 students__student_record__id__position))

(declare-const students__student_record__gender__first__bit Int)

(declare-const students__student_record__gender__last__bit Int)

(declare-const students__student_record__gender__position Int)

;; students__student_record__gender__first__bit_axiom
  (assert (<= 0 students__student_record__gender__first__bit))

;; students__student_record__gender__last__bit_axiom
  (assert
  (< students__student_record__gender__first__bit students__student_record__gender__last__bit))

;; students__student_record__gender__position_axiom
  (assert (<= 0 students__student_record__gender__position))

(declare-const students__student_record__gpa__first__bit Int)

(declare-const students__student_record__gpa__last__bit Int)

(declare-const students__student_record__gpa__position Int)

;; students__student_record__gpa__first__bit_axiom
  (assert (<= 0 students__student_record__gpa__first__bit))

;; students__student_record__gpa__last__bit_axiom
  (assert
  (< students__student_record__gpa__first__bit students__student_record__gpa__last__bit))

;; students__student_record__gpa__position_axiom
  (assert (<= 0 students__student_record__gpa__position))

(declare-const students__student_record__part_time__first__bit Int)

(declare-const students__student_record__part_time__last__bit Int)

(declare-const students__student_record__part_time__position Int)

;; students__student_record__part_time__first__bit_axiom
  (assert (<= 0 students__student_record__part_time__first__bit))

;; students__student_record__part_time__last__bit_axiom
  (assert
  (< students__student_record__part_time__first__bit students__student_record__part_time__last__bit))

;; students__student_record__part_time__position_axiom
  (assert (<= 0 students__student_record__part_time__position))

(declare-const students__student_record__in_state__first__bit Int)

(declare-const students__student_record__in_state__last__bit Int)

(declare-const students__student_record__in_state__position Int)

;; students__student_record__in_state__first__bit_axiom
  (assert (<= 0 students__student_record__in_state__first__bit))

;; students__student_record__in_state__last__bit_axiom
  (assert
  (< students__student_record__in_state__first__bit students__student_record__in_state__last__bit))

;; students__student_record__in_state__position_axiom
  (assert (<= 0 students__student_record__in_state__position))

(declare-const students__student_record__resident__first__bit Int)

(declare-const students__student_record__resident__last__bit Int)

(declare-const students__student_record__resident__position Int)

;; students__student_record__resident__first__bit_axiom
  (assert (<= 0 students__student_record__resident__first__bit))

;; students__student_record__resident__last__bit_axiom
  (assert
  (< students__student_record__resident__first__bit students__student_record__resident__last__bit))

;; students__student_record__resident__position_axiom
  (assert (<= 0 students__student_record__resident__position))

(declare-const students__student_record__meal_plan__first__bit Int)

(declare-const students__student_record__meal_plan__last__bit Int)

(declare-const students__student_record__meal_plan__position Int)

;; students__student_record__meal_plan__first__bit_axiom
  (assert (<= 0 students__student_record__meal_plan__first__bit))

;; students__student_record__meal_plan__last__bit_axiom
  (assert
  (< students__student_record__meal_plan__first__bit students__student_record__meal_plan__last__bit))

;; students__student_record__meal_plan__position_axiom
  (assert (<= 0 students__student_record__meal_plan__position))

(declare-const students__student_record__self_insured__first__bit Int)

(declare-const students__student_record__self_insured__last__bit Int)

(declare-const students__student_record__self_insured__position Int)

;; students__student_record__self_insured__first__bit_axiom
  (assert (<= 0 students__student_record__self_insured__first__bit))

;; students__student_record__self_insured__last__bit_axiom
  (assert
  (< students__student_record__self_insured__first__bit students__student_record__self_insured__last__bit))

;; students__student_record__self_insured__position_axiom
  (assert (<= 0 students__student_record__self_insured__position))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((student_record__ref 0))
(((student_record__refqtmk (student_record__content us_rep)))))
(define-fun student_record__ref_student_record__content__projection ((a student_record__ref)) us_rep 
  (student_record__content a))

(declare-const student us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const base_tuition Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

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

(define-fun mod2 ((x Int)
  (y Int)) Int (ite (< 0 y) (mod x y) (+ (mod x y) y)))

(define-fun pos_div_relation ((res Int) (num Int)
  (den Int)) Bool (let ((exact (div1 num den)))
                  (ite (= num 0) (= res 0)
                  (ite (= num (* exact den)) (= res exact)
                  (and (<= exact res) (<= res (+ exact 1)))))))

(declare-fun fxp_div_int (Int Int) Int)

;; fxp_div_int_def
  (assert
  (forall ((x Int))
  (forall ((y Int))
  (! (ite (= x 0) (= (fxp_div_int x y) 0)
     (ite (and (< 0 x) (< 0 y)) (pos_div_relation (fxp_div_int x y) x y)
     (ite (and (< x 0) (< y 0)) (pos_div_relation (fxp_div_int x y) (- x)
     (- y))
     (ite (and (< x 0) (< 0 y)) (pos_div_relation (- (fxp_div_int x y)) (- x)
     y)
     (=> (and (< 0 x) (< y 0)) (pos_div_relation (- (fxp_div_int x y)) x
     (- y))))))) :pattern ((fxp_div_int x y)) ))))

(declare-fun to_int1 (Int) Int)

;; to_int_def
  (assert
  (forall ((x Int))
  (! (ite (= x 0) (= (to_int1 x) 0)
     (ite (< 0 x) (pos_div_relation (to_int1 x) (* x 1) 128)
     (pos_div_relation (- (to_int1 x)) (* (- x) 1) 128))) :pattern ((to_int1
                                                                    x)) )))

(declare-fun of_int (Int) Int)

;; of_int_def
  (assert
  (forall ((x Int))
  (! (ite (= x 0) (= (of_int x) 0)
     (ite (< 0 x) (pos_div_relation (of_int x) (* x 128) 1) (pos_div_relation
     (- (of_int x)) (* (- x) 128) 1))) :pattern ((of_int x)) )))

(declare-sort tmoney_typeB 0)

(define-fun in_range6 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-const dummy6 tmoney_typeB)

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (tmoney_typeB tmoney_typeB) Bool)

(declare-datatypes ((tmoney_typeB__ref 0))
(((tmoney_typeB__refqtmk (tmoney_typeB__content tmoney_typeB)))))
(define-fun tmoney_typeB__ref_tmoney_typeB__content__projection ((a tmoney_typeB__ref)) tmoney_typeB 
  (tmoney_typeB__content a))

(declare-sort money_type 0)

(define-fun in_range7 ((x Int)) Bool (and (<= (- 12799999) x)
                                     (<= x 12799999)))

(declare-const dummy7 money_type)

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq7 (money_type money_type) Bool)

(declare-datatypes ((money_type__ref 0))
(((money_type__refqtmk (money_type__content money_type)))))
(define-fun money_type__ref_money_type__content__projection ((a money_type__ref)) money_type 
  (money_type__content a))

(define-fun dynamic_invariant ((temp___expr_194 Int)
  (temp___is_init_190 Bool) (temp___skip_constant_191 Bool)
  (temp___do_toplevel_192 Bool)
  (temp___do_typ_inv_193 Bool)) Bool (=>
                                     (or (= temp___is_init_190 true)
                                     (<= (- 12799999) 12799999)) (in_range7
                                     temp___expr_194)))

(define-fun dynamic_invariant1 ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (<= 0 2)) (in_range1 temp___expr_159)))

(define-fun dynamic_invariant2 ((temp___expr_166 Int)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (<= 0 3)) (in_range2 temp___expr_166)))

(define-fun dynamic_invariant3 ((temp___expr_173 Int)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (=>
                                     (or (= temp___is_init_169 true)
                                     (<= 0 999999)) (in_range3
                                     temp___expr_173)))

(define-fun dynamic_invariant4 ((temp___expr_187 Int)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=>
                                     (or (= temp___is_init_183 true)
                                     (<= 0 512)) (in_range4 temp___expr_187)))

(define-fun dynamic_invariant5 ((temp___expr_201 Int)
  (temp___is_init_197 Bool) (temp___skip_constant_198 Bool)
  (temp___do_toplevel_199 Bool)
  (temp___do_typ_inv_200 Bool)) Bool (=>
                                     (or (= temp___is_init_197 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range5 temp___expr_201)))

(assert
;; defqtvc
 ;; File "students.ads", line 17, characters 0-0
  (not
  (forall ((tuition Int) (fees Int) (grants Int) (insurance Int)
  (tuition1 Int) (spark__branch Bool) (tuition2 Int) (spark__branch1 Bool)
  (insurance1 Int) (spark__branch2 Bool) (fees1 Int) (spark__branch3 Bool)
  (o Int) (spark__branch4 Bool) (o1 Int) (spark__branch5 Bool) (o2 Int)
  (spark__branch6 Bool))
  (=> (dynamic_invariant base_tuition true false true true)
  (=> (<= 0 base_tuition)
  (=> (< base_tuition 2560000)
  (=> (dynamic_invariant tuition false false true true)
  (=> (dynamic_invariant fees false false true true)
  (=> (= grants 0)
  (=> (dynamic_invariant grants true false true true)
  (=> (= insurance 0)
  (=> (dynamic_invariant insurance true false true true)
  (=> (= tuition1 base_tuition)
  (=>
  (= spark__branch (ite (= (rec__students__student_record__in_state
                           (us_split_fields1 student)) true)
                   false true))
  (=>
  (ite (= spark__branch true)
  (= tuition2 (+ tuition1 (fxp_div_int tuition1 2))) (= tuition2 tuition1))
  (=> (<= tuition2 3840000)
  (=>
  (= spark__branch1 (ite (= (rec__students__student_record__self_insured
                            (us_split_fields1 student)) true)
                    false true))
  (=>
  (ite (= spark__branch1 true) (= insurance1 128000)
  (= insurance1 insurance))
  (=>
  (= spark__branch2 (rec__students__student_record__part_time
                    (us_split_fields1 student)))
  (=> (ite (= spark__branch2 true) (= fees1 12800) (= fees1 64000))
  (=>
  (= spark__branch3 (rec__students__student_record__resident
                    (us_split_fields1 student)))
  (=> (not (= spark__branch3 true))
  (=>
  (= (to_rep1
     (rec__students__student_record__meal_plan (us_split_fields1 student))) o)
  (=> (= spark__branch4 (ite (= o 0) true false))
  (=> (not (= spark__branch4 true))
  (=>
  (= (to_rep1
     (rec__students__student_record__meal_plan (us_split_fields1 student))) o1)
  (=> (= spark__branch5 (ite (= o1 1) true false))
  (=> (not (= spark__branch5 true))
  (=>
  (= (to_rep1
     (rec__students__student_record__meal_plan (us_split_fields1 student))) o2)
  (=> (= spark__branch6 (ite (= o2 2) true false))
  (=> (= spark__branch6 true) (in_range6 (+ fees1 192000)))))))))))))))))))))))))))))))))
(check-sat)
(exit)
