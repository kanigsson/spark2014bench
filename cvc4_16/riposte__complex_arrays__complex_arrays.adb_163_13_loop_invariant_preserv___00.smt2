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

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort value 0)

(declare-fun valueqtint (value) Int)

;; value'axiom
  (assert
  (forall ((i1 value))
  (and (<= (- 23) (valueqtint i1)) (<= (valueqtint i1) 69))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 23) x) (<= x 69)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (value value) Bool)

(declare-const dummy value)

(declare-datatypes ((value__ref 0))
(((value__refqtmk (value__content value)))))
(define-fun value__ref_value__content__projection ((a value__ref)) value 
  (value__content a))

(define-fun to_rep ((x value)) Int (valueqtint x))

(declare-fun of_rep (Int) value)

;; inversion_axiom
  (assert
  (forall ((x value)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x value)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int value))))))
(declare-fun slide ((Array Int value) Int Int) (Array Int value))

;; slide_eq
  (assert
  (forall ((a (Array Int value)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int value)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i1 Int))
  (! (= (select (slide a old_first new_first) i1) (select a (- i1 (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i1)) ))))))

(define-fun bool_eq ((a (Array Int value)) (a__first Int) (a__last Int)
  (b (Array Int value)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int value)) (b (Array Int value)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i1 index))
  (and (<= 0 (indexqtint i1)) (<= (indexqtint i1) 1001))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 1001)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (index index) Bool)

(declare-const dummy1 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun dynamic_invariant ((temp___expr_169 Int)
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (=>
                                     (or (= temp___is_init_165 true)
                                     (<= 0 1001)) (in_range2
                                     temp___expr_169)))

(declare-sort tcounterB 0)

(declare-fun tcounterBqtint (tcounterB) Int)

;; tcounterB'axiom
  (assert
  (forall ((i1 tcounterB))
  (and (<= (- 32768) (tcounterBqtint i1)) (<= (tcounterBqtint i1) 32767))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 32768) x) (<= x 32767)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (tcounterB tcounterB) Bool)

(declare-const dummy2 tcounterB)

(declare-datatypes ((tcounterB__ref 0))
(((tcounterB__refqtmk (tcounterB__content tcounterB)))))
(define-fun tcounterB__ref_tcounterB__content__projection ((a tcounterB__ref)) tcounterB 
  (tcounterB__content a))

(define-fun to_rep1 ((x tcounterB)) Int (tcounterBqtint x))

(declare-fun of_rep1 (Int) tcounterB)

;; inversion_axiom
  (assert
  (forall ((x tcounterB))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x tcounterB)) (! (in_range3
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (tcounterB tcounterB) Bool)

(declare-const dummy3 tcounterB)

(declare-datatypes ((t24b__ref 0))
(((t24b__refqtmk (t24b__content tcounterB)))))
(define-fun t24b__ref_t24b__content__projection ((a t24b__ref)) tcounterB 
  (t24b__content a))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq4 (tcounterB tcounterB) Bool)

(declare-const dummy4 tcounterB)

(declare-datatypes ((t29b__ref 0))
(((t29b__refqtmk (t29b__content tcounterB)))))
(define-fun t29b__ref_t29b__content__projection ((a t29b__ref)) tcounterB 
  (t29b__content a))

(declare-fun temp_____aggregate_def_305 (Int) (Array Int value))

(define-fun dynamic_invariant1 ((temp___expr_176 Int)
  (temp___is_init_172 Bool) (temp___skip_constant_173 Bool)
  (temp___do_toplevel_174 Bool)
  (temp___do_typ_inv_175 Bool)) Bool (=>
                                     (or (= temp___is_init_172 true)
                                     (<= (- 23) 69)) (in_range1
                                     temp___expr_176)))

(declare-const rliteral value)

;; rliteral_axiom
  (assert (= (valueqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___307 Int))
  (=> (dynamic_invariant1 temp___307 true true true true)
  (forall ((temp___308 Int))
  (= (select (temp_____aggregate_def_305 temp___307) temp___308) rliteral)))))

(declare-const rliteral1 value)

;; rliteral_axiom
  (assert (= (valueqtint rliteral1) (- 23)))

(declare-const rliteral2 value)

;; rliteral_axiom
  (assert (= (valueqtint rliteral2) 69))

(assert
;; defqtvc
 ;; File "complex_arrays.adb", line 141, characters 0-0
  (not
  (forall ((tmp (Array Int value)) (tmp1 (Array Int value)))
  (=> (dynamic_invariant i true false true true)
  (=> (= tmp (temp_____aggregate_def_305 0))
  (=>
  (let ((temp___310 i))
  (exists ((j Int))
  (and (= j 0)
  (ite (= (and (ite (<= 0 j) true false) (ite (<= j temp___310) true false)) true)
  (exists ((temp___loop_entry_315 Int))
  (and (= temp___loop_entry_315 i)
  (exists ((tmp2 (Array Int value)))
  (and (= tmp2 (store tmp j rliteral1))
  (exists ((j1 Int))
  (and
  (and
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k j1))
  (=> (<= k j1) (= (to_rep (select tmp1 k)) (- 23)))))
  (= i temp___loop_entry_315))
  (and
  (= (and (ite (and (dynamic_property 0 i j1)
               (forall ((temp___313 Int))
               (=> (and (<= 0 temp___313) (<= temp___313 1001))
               (=>
               (or (< temp___310 temp___313)
               (or (< temp___313 0) (< j1 temp___313)))
               (= (select tmp1 temp___313) (select tmp temp___313))))))
          true false) (ite (and (<= 0 j1) (<= j1 i)) true false)) true)
  (= j1 temp___310)))))))) (= tmp1 tmp)))))
  (let ((temp___316 i))
  (forall ((j Int))
  (=> (= j temp___316)
  (=>
  (= (and (ite (<= temp___316 j) true false) (ite (<= j 1001) true false)) true)
  (forall ((tmp2 (Array Int value)))
  (=> (= tmp2 (store tmp1 j rliteral2))
  (forall ((tmp3 (Array Int value)) (j1 Int))
  (=>
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k j1))
  (and (=> (< k i) (= (to_rep (select tmp3 k)) (- 23)))
  (=> (<= i k) (= (to_rep (select tmp3 k)) 69)))))
  (=>
  (= (and (ite (and (dynamic_property1 i 1001 j1)
               (forall ((temp___320 Int))
               (=> (and (<= 0 temp___320) (<= temp___320 1001))
               (=>
               (or (< 1001 temp___320)
               (or (< temp___320 temp___316) (< j1 temp___320)))
               (= (select tmp3 temp___320) (select tmp1 temp___320))))))
          true false) (ite (and (<= i j1) (<= j1 1001)) true false)) true)
  (=> (not (= j1 1001))
  (forall ((j2 Int))
  (=> (= j2 (+ j1 1))
  (forall ((tmp4 (Array Int value)))
  (=> (= tmp4 (store tmp3 j2 rliteral2))
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k j2))
  (=> (< k i) (= (to_rep (select tmp4 k)) (- 23)))))))))))))))))))))))))
(check-sat)
(exit)
