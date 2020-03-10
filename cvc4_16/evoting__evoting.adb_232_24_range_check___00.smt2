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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-const program_phase Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const last_candidate Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort counter_range_t 0)

(declare-fun counter_range_tqtint (counter_range_t) Int)

;; counter_range_t'axiom
  (assert
  (forall ((i counter_range_t))
  (and (<= 0 (counter_range_tqtint i)) (<= (counter_range_tqtint i) 10000))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (counter_range_t counter_range_t) Bool)

(declare-const dummy counter_range_t)

(declare-datatypes ((counter_range_t__ref 0))
(((counter_range_t__refqtmk (counter_range_t__content counter_range_t)))))
(define-fun counter_range_t__ref_counter_range_t__content__projection ((a counter_range_t__ref)) counter_range_t 
  (counter_range_t__content a))

(define-fun to_rep ((x counter_range_t)) Int (counter_range_tqtint x))

(declare-fun of_rep (Int) counter_range_t)

;; inversion_axiom
  (assert
  (forall ((x counter_range_t))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x counter_range_t)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int counter_range_t))))))
(declare-fun slide ((Array Int counter_range_t) Int
  Int) (Array Int counter_range_t))

;; slide_eq
  (assert
  (forall ((a (Array Int counter_range_t)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int counter_range_t)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int counter_range_t)) (a__first Int)
  (a__last Int) (b (Array Int counter_range_t)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_156 Int))
                           (=>
                           (and (<= a__first temp___idx_156)
                           (<= temp___idx_156 a__last))
                           (= (to_rep (select a temp___idx_156)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_156)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int counter_range_t)) (b (Array Int counter_range_t)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_156 Int))
  (=> (and (<= a__first temp___idx_156) (<= temp___idx_156 a__last))
  (= (to_rep (select a temp___idx_156)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_156)))))))))))

(declare-const counters (Array Int counter_range_t))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int Bool))))))
(declare-fun slide1 ((Array Int Bool) Int Int) (Array Int Bool))

;; slide_eq
  (assert
  (forall ((a (Array Int Bool)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int Bool)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int Bool)) (a__first Int) (a__last Int)
  (b (Array Int Bool)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_157 Int))
                           (=>
                           (and (<= a__first temp___idx_157)
                           (<= temp___idx_157 a__last))
                           (= (ite (select a temp___idx_157) 1 0) (ite (select b (+ (- b__first a__first) temp___idx_157)) 1 0)))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int Bool)) (b (Array Int Bool)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_157 Int))
  (=> (and (<= a__first temp___idx_157) (<= temp___idx_157 a__last))
  (= (ite (select a temp___idx_157) 1 0) (ite (select b (+ (- b__first a__first) temp___idx_157)) 1 0)))))))))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-sort program_phase_t 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (program_phase_t program_phase_t) Bool)

(declare-const dummy1 program_phase_t)

(declare-datatypes ((program_phase_t__ref 0))
(((program_phase_t__refqtmk (program_phase_t__content program_phase_t)))))
(define-fun program_phase_t__ref_program_phase_t__content__projection ((a program_phase_t__ref)) program_phase_t 
  (program_phase_t__content a))

(define-fun dynamic_invariant ((temp___expr_191 Int)
  (temp___is_init_187 Bool) (temp___skip_constant_188 Bool)
  (temp___do_toplevel_189 Bool)
  (temp___do_typ_inv_190 Bool)) Bool (=>
                                     (or (= temp___is_init_187 true)
                                     (<= 0 2)) (in_range2 temp___expr_191)))

(declare-sort tcandidate_number_tB 0)

(declare-fun tcandidate_number_tBqtint (tcandidate_number_tB) Int)

;; tcandidate_number_tB'axiom
  (assert
  (forall ((i tcandidate_number_tB))
  (and (<= (- 128) (tcandidate_number_tBqtint i))
  (<= (tcandidate_number_tBqtint i) 127))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 128) x) (<= x 127)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (tcandidate_number_tB tcandidate_number_tB) Bool)

(declare-const dummy2 tcandidate_number_tB)

(declare-datatypes ((tcandidate_number_tB__ref 0))
(((tcandidate_number_tB__refqtmk
  (tcandidate_number_tB__content tcandidate_number_tB)))))
(define-fun tcandidate_number_tB__ref_tcandidate_number_tB__content__projection ((a tcandidate_number_tB__ref)) tcandidate_number_tB 
  (tcandidate_number_tB__content a))

(declare-sort candidate_number_t 0)

(declare-fun candidate_number_tqtint (candidate_number_t) Int)

;; candidate_number_t'axiom
  (assert
  (forall ((i candidate_number_t))
  (and (<= 0 (candidate_number_tqtint i))
  (<= (candidate_number_tqtint i) 20))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 20)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (candidate_number_t candidate_number_t) Bool)

(declare-const dummy3 candidate_number_t)

(declare-datatypes ((candidate_number_t__ref 0))
(((candidate_number_t__refqtmk
  (candidate_number_t__content candidate_number_t)))))
(define-fun candidate_number_t__ref_candidate_number_t__content__projection ((a candidate_number_t__ref)) candidate_number_t 
  (candidate_number_t__content a))

(define-fun dynamic_invariant1 ((temp___expr_205 Int)
  (temp___is_init_201 Bool) (temp___skip_constant_202 Bool)
  (temp___do_toplevel_203 Bool)
  (temp___do_typ_inv_204 Bool)) Bool (=>
                                     (or (= temp___is_init_201 true)
                                     (<= 0 20)) (in_range4 temp___expr_205)))

(define-fun to_rep1 ((x tcandidate_number_tB)) Int (tcandidate_number_tBqtint
                                                   x))

(declare-fun of_rep1 (Int) tcandidate_number_tB)

;; inversion_axiom
  (assert
  (forall ((x tcandidate_number_tB))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x tcandidate_number_tB)) (! (in_range3
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq4 (tcandidate_number_tB tcandidate_number_tB) Bool)

(declare-const dummy4 tcandidate_number_tB)

(declare-datatypes ((t59b__ref 0))
(((t59b__refqtmk (t59b__content tcandidate_number_tB)))))
(define-fun t59b__ref_t59b__content__projection ((a t59b__ref)) tcandidate_number_tB 
  (t59b__content a))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq5 (tcandidate_number_tB tcandidate_number_tB) Bool)

(declare-const dummy5 tcandidate_number_tB)

(declare-datatypes ((t68b__ref 0))
(((t68b__refqtmk (t68b__content tcandidate_number_tB)))))
(define-fun t68b__ref_t68b__content__projection ((a t68b__ref)) tcandidate_number_tB 
  (t68b__content a))

(define-fun dynamic_property2 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq6 (tcandidate_number_tB tcandidate_number_tB) Bool)

(declare-const dummy6 tcandidate_number_tB)

(declare-datatypes ((t73b__ref 0))
(((t73b__refqtmk (t73b__content tcandidate_number_tB)))))
(define-fun t73b__ref_t73b__content__projection ((a t73b__ref)) tcandidate_number_tB 
  (t73b__content a))

(define-fun dynamic_invariant2 ((temp___expr_198 Int)
  (temp___is_init_194 Bool) (temp___skip_constant_195 Bool)
  (temp___do_toplevel_196 Bool)
  (temp___do_typ_inv_197 Bool)) Bool (=>
                                     (or (= temp___is_init_194 true)
                                     (<= 0 10000)) (in_range1
                                     temp___expr_198)))

(assert
;; defqtvc
 ;; File "evoting.ads", line 99, characters 0-0
  (not
  (forall ((winners (Array Int Bool)) (latest_highest_score Int)
  (winners1 (Array Int Bool)) (latest_highest_score1 Int)
  (winners2 (Array Int Bool)))
  (=> (dynamic_invariant program_phase true false true true)
  (=> (dynamic_invariant1 last_candidate true false true true)
  (=> (= program_phase 2)
  (=> (dynamic_invariant1 latest_highest_score false false true true)
  (=> (= winners1 (store winners 0 (distinct 0 0)))
  (=> (= latest_highest_score1 1)
  (=> (= winners2 (store winners1 latest_highest_score1 (distinct 1 0)))
  (forall ((i Int))
  (=> (= i 2)
  (=>
  (= (and (ite (<= 2 i) true false) (ite (<= i last_candidate) true false)) true)
  (=>
  (= (ite (and (= (ite (select winners2 0) 1 0) (ite (distinct 0 0) 1 0))
          (< latest_highest_score1 i))
     (select winners2 latest_highest_score1) false) true)
  (=> (<= 1 (- i 1)) (<= 0 1))))))))))))))))
(check-sat)
(exit)
