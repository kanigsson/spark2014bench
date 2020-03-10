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

(declare-sort value 0)

(declare-fun valueqtint (value) Int)

;; value'axiom
  (assert
  (forall ((i value))
  (and (<= (- 23) (valueqtint i)) (<= (valueqtint i) 69))))

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

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__arrays_of_records__basic_record__flag Bool)(rec__arrays_of_records__basic_record__first_value value)(rec__arrays_of_records__basic_record__second_value value)))))
(define-fun us_split_fields_rec__arrays_of_records__basic_record__flag__projection ((a us_split_fields)) Bool 
  (rec__arrays_of_records__basic_record__flag a))

(define-fun us_split_fields_rec__arrays_of_records__basic_record__first_value__projection ((a us_split_fields)) value 
  (rec__arrays_of_records__basic_record__first_value a))

(define-fun us_split_fields_rec__arrays_of_records__basic_record__second_value__projection ((a us_split_fields)) value 
  (rec__arrays_of_records__basic_record__second_value a))

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
                        (= (ite (rec__arrays_of_records__basic_record__flag
                                (us_split_fields1 a)) 1 0) (ite (rec__arrays_of_records__basic_record__flag
                                                                (us_split_fields1
                                                                b)) 1 0))
                        (= (to_rep
                           (rec__arrays_of_records__basic_record__first_value
                           (us_split_fields1 a))) (to_rep
                                                  (rec__arrays_of_records__basic_record__first_value
                                                  (us_split_fields1 b)))))
                        (= (to_rep
                           (rec__arrays_of_records__basic_record__second_value
                           (us_split_fields1 a))) (to_rep
                                                  (rec__arrays_of_records__basic_record__second_value
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

(declare-const arrays_of_records__basic_record__flag__first__bit Int)

(declare-const arrays_of_records__basic_record__flag__last__bit Int)

(declare-const arrays_of_records__basic_record__flag__position Int)

;; arrays_of_records__basic_record__flag__first__bit_axiom
  (assert (<= 0 arrays_of_records__basic_record__flag__first__bit))

;; arrays_of_records__basic_record__flag__last__bit_axiom
  (assert
  (< arrays_of_records__basic_record__flag__first__bit arrays_of_records__basic_record__flag__last__bit))

;; arrays_of_records__basic_record__flag__position_axiom
  (assert (<= 0 arrays_of_records__basic_record__flag__position))

(declare-const arrays_of_records__basic_record__first_value__first__bit Int)

(declare-const arrays_of_records__basic_record__first_value__last__bit Int)

(declare-const arrays_of_records__basic_record__first_value__position Int)

;; arrays_of_records__basic_record__first_value__first__bit_axiom
  (assert (<= 0 arrays_of_records__basic_record__first_value__first__bit))

;; arrays_of_records__basic_record__first_value__last__bit_axiom
  (assert
  (< arrays_of_records__basic_record__first_value__first__bit arrays_of_records__basic_record__first_value__last__bit))

;; arrays_of_records__basic_record__first_value__position_axiom
  (assert (<= 0 arrays_of_records__basic_record__first_value__position))

(declare-const arrays_of_records__basic_record__second_value__first__bit Int)

(declare-const arrays_of_records__basic_record__second_value__last__bit Int)

(declare-const arrays_of_records__basic_record__second_value__position Int)

;; arrays_of_records__basic_record__second_value__first__bit_axiom
  (assert (<= 0 arrays_of_records__basic_record__second_value__first__bit))

;; arrays_of_records__basic_record__second_value__last__bit_axiom
  (assert
  (< arrays_of_records__basic_record__second_value__first__bit arrays_of_records__basic_record__second_value__last__bit))

;; arrays_of_records__basic_record__second_value__position_axiom
  (assert (<= 0 arrays_of_records__basic_record__second_value__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((basic_record__ref 0))
(((basic_record__refqtmk (basic_record__content us_rep)))))
(define-fun basic_record__ref_basic_record__content__projection ((a basic_record__ref)) us_rep 
  (basic_record__content a))

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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 0 (indexqtint i)) (<= (indexqtint i) 1001))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 1001)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (index index) Bool)

(declare-const dummy2 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun dynamic_invariant ((temp___expr_173 Int)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (=>
                                     (or (= temp___is_init_169 true)
                                     (<= (- 23) 69)) (in_range1
                                     temp___expr_173)))

(define-fun dynamic_invariant1 ((temp___expr_166 Int)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (<= 0 1001)) (in_range2
                                     temp___expr_166)))

(assert
;; defqtvc
 ;; File "arrays_of_records.adb", line 191, characters 0-0
  (not
  (forall ((a (Array Int us_rep)) (tmp Int) (a1 (Array Int us_rep)) (o Int)
  (tmp1 Int))
  (=> (= a1 a)
  (=> (dynamic_invariant tmp false false true true)
  (=>
  (= (to_rep
     (rec__arrays_of_records__basic_record__first_value
     (us_split_fields1 (select a 17)))) o)
  (=> (= tmp1 o)
  (let ((q_ (us_split_fields1 (select a 17))))
  (forall ((o1 Int))
  (=>
  (= (to_rep
     (rec__arrays_of_records__basic_record__first_value
     (us_split_fields1 (select a 5)))) o1)
  (forall ((o2 value))
  (=> (= (to_rep o2) o1)
  (forall ((a2 (Array Int us_rep)))
  (=>
  (= a2 (store a 17 (us_repqtmk
                    (us_split_fieldsqtmk
                    (rec__arrays_of_records__basic_record__flag q_) o2
                    (rec__arrays_of_records__basic_record__second_value q_)))))
  (let ((q_1 (us_split_fields1 (select a2 5))))
  (forall ((o3 value))
  (=> (= (to_rep o3) tmp1)
  (forall ((a3 (Array Int us_rep)))
  (=>
  (= a3 (store a2 5 (us_repqtmk
                    (us_split_fieldsqtmk
                    (rec__arrays_of_records__basic_record__flag q_1) o3
                    (rec__arrays_of_records__basic_record__second_value q_1)))))
  (= (bool_eq1 a3 0 1001 a1 0 1001) true))))))))))))))))))))
(check-sat)
(exit)
