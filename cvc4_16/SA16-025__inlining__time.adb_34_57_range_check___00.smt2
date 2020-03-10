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

(define-fun in_range1 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(declare-sort year_t 0)

(declare-fun year_tqtint (year_t) Int)

;; year_t'axiom
  (assert
  (forall ((i year_t))
  (and (<= 0 (year_tqtint i)) (<= (year_tqtint i) 9999))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 9999)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (year_t year_t) Bool)

(declare-const dummy1 year_t)

(declare-datatypes ((year_t__ref 0))
(((year_t__refqtmk (year_t__content year_t)))))
(define-fun year_t__ref_year_t__content__projection ((a year_t__ref)) year_t 
  (year_t__content a))

(define-fun to_rep ((x year_t)) Int (year_tqtint x))

(declare-fun of_rep (Int) year_t)

;; inversion_axiom
  (assert
  (forall ((x year_t)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x year_t)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort day_of_year_t 0)

(declare-fun day_of_year_tqtint (day_of_year_t) Int)

;; day_of_year_t'axiom
  (assert
  (forall ((i day_of_year_t))
  (and (<= 0 (day_of_year_tqtint i)) (<= (day_of_year_tqtint i) 366))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 366)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (day_of_year_t day_of_year_t) Bool)

(declare-const dummy2 day_of_year_t)

(declare-datatypes ((day_of_year_t__ref 0))
(((day_of_year_t__refqtmk (day_of_year_t__content day_of_year_t)))))
(define-fun day_of_year_t__ref_day_of_year_t__content__projection ((a day_of_year_t__ref)) day_of_year_t 
  (day_of_year_t__content a))

(define-fun to_rep1 ((x day_of_year_t)) Int (day_of_year_tqtint x))

(declare-fun of_rep1 (Int) day_of_year_t)

;; inversion_axiom
  (assert
  (forall ((x day_of_year_t))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x day_of_year_t)) (! (in_range3
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort second_of_day_t 0)

(declare-fun second_of_day_tqtint (second_of_day_t) Int)

;; second_of_day_t'axiom
  (assert
  (forall ((i second_of_day_t))
  (and (<= 0 (second_of_day_tqtint i)) (<= (second_of_day_tqtint i) 86399))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 86399)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (second_of_day_t second_of_day_t) Bool)

(declare-const dummy3 second_of_day_t)

(declare-datatypes ((second_of_day_t__ref 0))
(((second_of_day_t__refqtmk (second_of_day_t__content second_of_day_t)))))
(define-fun second_of_day_t__ref_second_of_day_t__content__projection ((a second_of_day_t__ref)) second_of_day_t 
  (second_of_day_t__content a))

(define-fun to_rep2 ((x second_of_day_t)) Int (second_of_day_tqtint x))

(declare-fun of_rep2 (Int) second_of_day_t)

;; inversion_axiom
  (assert
  (forall ((x second_of_day_t))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x second_of_day_t)) (! (in_range4
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort nanopart_of_whole_t 0)

(declare-fun nanopart_of_whole_tqtint (nanopart_of_whole_t) Int)

;; nanopart_of_whole_t'axiom
  (assert
  (forall ((i nanopart_of_whole_t))
  (and (<= 0 (nanopart_of_whole_tqtint i))
  (<= (nanopart_of_whole_tqtint i) 999999999))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 999999999)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq4 (nanopart_of_whole_t nanopart_of_whole_t) Bool)

(declare-const dummy4 nanopart_of_whole_t)

(declare-datatypes ((nanopart_of_whole_t__ref 0))
(((nanopart_of_whole_t__refqtmk
  (nanopart_of_whole_t__content nanopart_of_whole_t)))))
(define-fun nanopart_of_whole_t__ref_nanopart_of_whole_t__content__projection ((a nanopart_of_whole_t__ref)) nanopart_of_whole_t 
  (nanopart_of_whole_t__content a))

(define-fun to_rep3 ((x nanopart_of_whole_t)) Int (nanopart_of_whole_tqtint
                                                  x))

(declare-fun of_rep3 (Int) nanopart_of_whole_t)

;; inversion_axiom
  (assert
  (forall ((x nanopart_of_whole_t))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x nanopart_of_whole_t)) (! (in_range5
  (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range5 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__time__t__valid Bool)(rec__time__t__year year_t)(rec__time__t__day day_of_year_t)(rec__time__t__second second_of_day_t)(rec__time__t__fraction nanopart_of_whole_t)))))
(define-fun us_split_fields_rec__time__t__valid__projection ((a us_split_fields)) Bool 
  (rec__time__t__valid a))

(define-fun us_split_fields_rec__time__t__year__projection ((a us_split_fields)) year_t 
  (rec__time__t__year a))

(define-fun us_split_fields_rec__time__t__day__projection ((a us_split_fields)) day_of_year_t 
  (rec__time__t__day a))

(define-fun us_split_fields_rec__time__t__second__projection ((a us_split_fields)) second_of_day_t 
  (rec__time__t__second a))

(define-fun us_split_fields_rec__time__t__fraction__projection ((a us_split_fields)) nanopart_of_whole_t 
  (rec__time__t__fraction a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (ite (rec__time__t__valid (us_split_fields1 a)) 1 0) (ite 
                        (rec__time__t__valid (us_split_fields1 b)) 1 0))
                        (= (to_rep (rec__time__t__year (us_split_fields1 a))) 
                        (to_rep (rec__time__t__year (us_split_fields1 b)))))
                        (and
                        (and
                        (= (to_rep1 (rec__time__t__day (us_split_fields1 a))) 
                        (to_rep1 (rec__time__t__day (us_split_fields1 b))))
                        (= (to_rep2
                           (rec__time__t__second (us_split_fields1 a))) 
                        (to_rep2 (rec__time__t__second (us_split_fields1 b)))))
                        (= (to_rep3
                           (rec__time__t__fraction (us_split_fields1 a))) 
                        (to_rep3
                        (rec__time__t__fraction (us_split_fields1 b))))))
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

(declare-const time__t__valid__first__bit Int)

(declare-const time__t__valid__last__bit Int)

(declare-const time__t__valid__position Int)

;; time__t__valid__first__bit_axiom
  (assert (<= 0 time__t__valid__first__bit))

;; time__t__valid__last__bit_axiom
  (assert (< time__t__valid__first__bit time__t__valid__last__bit))

;; time__t__valid__position_axiom
  (assert (<= 0 time__t__valid__position))

(declare-const time__t__year__first__bit Int)

(declare-const time__t__year__last__bit Int)

(declare-const time__t__year__position Int)

;; time__t__year__first__bit_axiom
  (assert (<= 0 time__t__year__first__bit))

;; time__t__year__last__bit_axiom
  (assert (< time__t__year__first__bit time__t__year__last__bit))

;; time__t__year__position_axiom
  (assert (<= 0 time__t__year__position))

(declare-const time__t__day__first__bit Int)

(declare-const time__t__day__last__bit Int)

(declare-const time__t__day__position Int)

;; time__t__day__first__bit_axiom
  (assert (<= 0 time__t__day__first__bit))

;; time__t__day__last__bit_axiom
  (assert (< time__t__day__first__bit time__t__day__last__bit))

;; time__t__day__position_axiom
  (assert (<= 0 time__t__day__position))

(declare-const time__t__second__first__bit Int)

(declare-const time__t__second__last__bit Int)

(declare-const time__t__second__position Int)

;; time__t__second__first__bit_axiom
  (assert (<= 0 time__t__second__first__bit))

;; time__t__second__last__bit_axiom
  (assert (< time__t__second__first__bit time__t__second__last__bit))

;; time__t__second__position_axiom
  (assert (<= 0 time__t__second__position))

(declare-const time__t__fraction__first__bit Int)

(declare-const time__t__fraction__last__bit Int)

(declare-const time__t__fraction__position Int)

;; time__t__fraction__first__bit_axiom
  (assert (<= 0 time__t__fraction__first__bit))

;; time__t__fraction__last__bit_axiom
  (assert (< time__t__fraction__first__bit time__t__fraction__last__bit))

;; time__t__fraction__position_axiom
  (assert (<= 0 time__t__fraction__position))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-const time_in us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const seconds Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun ddays_in_year (Int) Int)

(declare-fun ddays_in_year__function_guard (Int Int) Bool)

(define-fun dynamic_invariant1 ((temp___expr_166 Int)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (<= 0 9999)) (in_range2
                                     temp___expr_166)))

(declare-sort days_in_year_t 0)

(declare-fun days_in_year_tqtint (days_in_year_t) Int)

;; days_in_year_t'axiom
  (assert
  (forall ((i days_in_year_t))
  (and (<= 365 (days_in_year_tqtint i)) (<= (days_in_year_tqtint i) 366))))

(define-fun in_range6 ((x Int)) Bool (and (<= 365 x) (<= x 366)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (days_in_year_t days_in_year_t) Bool)

(declare-const dummy6 days_in_year_t)

(declare-datatypes ((days_in_year_t__ref 0))
(((days_in_year_t__refqtmk (days_in_year_t__content days_in_year_t)))))
(define-fun days_in_year_t__ref_days_in_year_t__content__projection ((a days_in_year_t__ref)) days_in_year_t 
  (days_in_year_t__content a))

(define-fun dynamic_invariant2 ((temp___expr_229 Int)
  (temp___is_init_225 Bool) (temp___skip_constant_226 Bool)
  (temp___do_toplevel_227 Bool)
  (temp___do_typ_inv_228 Bool)) Bool (=>
                                     (or (= temp___is_init_225 true)
                                     (<= 365 366)) (in_range6
                                     temp___expr_229)))

;; ddays_in_year__post_axiom
  (assert
  (forall ((year Int))
  (! (=> (dynamic_invariant1 year true true true true)
     (let ((result (ddays_in_year year)))
     (=> (ddays_in_year__function_guard result year) (dynamic_invariant2
     result true false true true)))) :pattern ((ddays_in_year year)) )))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(define-fun dynamic_invariant3 ((temp___expr_187 Int)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=>
                                     (or (= temp___is_init_183 true)
                                     (<= 0 366)) (in_range3 temp___expr_187)))

(define-fun dynamic_invariant4 ((temp___expr_215 Int)
  (temp___is_init_211 Bool) (temp___skip_constant_212 Bool)
  (temp___do_toplevel_213 Bool)
  (temp___do_typ_inv_214 Bool)) Bool (=>
                                     (or (= temp___is_init_211 true)
                                     (<= 0 86399)) (in_range4
                                     temp___expr_215)))

(define-fun dynamic_invariant5 ((temp___expr_222 Int)
  (temp___is_init_218 Bool) (temp___skip_constant_219 Bool)
  (temp___do_toplevel_220 Bool)
  (temp___do_typ_inv_221 Bool)) Bool (=>
                                     (or (= temp___is_init_218 true)
                                     (<= 0 999999999)) (in_range5
                                     temp___expr_222)))

(assert
;; defqtvc
 ;; File "time.ads", line 71, characters 0-0
  (not
  (forall ((temp_seconds Int) (temp_days Int) (temp_years Int)
  (temp_days_in_year Int) (temp_time__split_fields us_split_fields) (o Int)
  (temp_years1 Int))
  (=> (dynamic_invariant seconds true false true true)
  (=> (dynamic_invariant temp_seconds false false true true)
  (=> (dynamic_invariant temp_days false false true true)
  (=> (dynamic_invariant temp_years false false true true)
  (=> (dynamic_invariant temp_days_in_year false false true true)
  (=> (= temp_time__split_fields (us_split_fields1 time_in))
  (=> (= (to_rep (rec__time__t__year temp_time__split_fields)) o)
  (=> (= temp_years1 o) (in_range2 temp_years1))))))))))))
(check-sat)
(exit)
