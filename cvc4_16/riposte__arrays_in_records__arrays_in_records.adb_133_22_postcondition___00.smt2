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

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 0 (indexqtint i)) (<= (indexqtint i) 1001))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 1001)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (index index) Bool)

(declare-const dummy index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun to_rep ((x index)) Int (indexqtint x))

(declare-fun of_rep (Int) index)

;; inversion_axiom
  (assert
  (forall ((x index)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x index)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

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

(declare-fun user_eq1 (value value) Bool)

(declare-const dummy1 value)

(declare-datatypes ((value__ref 0))
(((value__refqtmk (value__content value)))))
(define-fun value__ref_value__content__projection ((a value__ref)) value 
  (value__content a))

(define-fun to_rep1 ((x value)) Int (valueqtint x))

(declare-fun of_rep1 (Int) value)

;; inversion_axiom
  (assert
  (forall ((x value))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x value)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

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
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

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
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
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
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const dummy2 (Array Int value))

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

(declare-fun user_eq2 ((Array Int value) (Array Int value)) Bool)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__arrays_in_records__record_with_arrays__counter index)(rec__arrays_in_records__record_with_arrays__first_array (Array Int value))(rec__arrays_in_records__record_with_arrays__second_array (Array Int value))))))
(define-fun us_split_fields_rec__arrays_in_records__record_with_arrays__counter__projection ((a us_split_fields)) index 
  (rec__arrays_in_records__record_with_arrays__counter a))

(define-fun us_split_fields_rec__arrays_in_records__record_with_arrays__first_array__projection ((a us_split_fields)) (Array Int value) 
  (rec__arrays_in_records__record_with_arrays__first_array a))

(define-fun us_split_fields_rec__arrays_in_records__record_with_arrays__second_array__projection ((a us_split_fields)) (Array Int value) 
  (rec__arrays_in_records__record_with_arrays__second_array a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep
                           (rec__arrays_in_records__record_with_arrays__counter
                           (us_split_fields1 a))) (to_rep
                                                  (rec__arrays_in_records__record_with_arrays__counter
                                                  (us_split_fields1 b))))
                        (= (bool_eq
                           (rec__arrays_in_records__record_with_arrays__first_array
                           (us_split_fields1 a)) 0 1001
                           (rec__arrays_in_records__record_with_arrays__first_array
                           (us_split_fields1 b)) 0 1001) true))
                        (= (bool_eq
                           (rec__arrays_in_records__record_with_arrays__second_array
                           (us_split_fields1 a)) 0 1001
                           (rec__arrays_in_records__record_with_arrays__second_array
                           (us_split_fields1 b)) 0 1001) true))
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

(declare-const arrays_in_records__record_with_arrays__counter__first__bit Int)

(declare-const arrays_in_records__record_with_arrays__counter__last__bit Int)

(declare-const arrays_in_records__record_with_arrays__counter__position Int)

;; arrays_in_records__record_with_arrays__counter__first__bit_axiom
  (assert (<= 0 arrays_in_records__record_with_arrays__counter__first__bit))

;; arrays_in_records__record_with_arrays__counter__last__bit_axiom
  (assert
  (< arrays_in_records__record_with_arrays__counter__first__bit arrays_in_records__record_with_arrays__counter__last__bit))

;; arrays_in_records__record_with_arrays__counter__position_axiom
  (assert (<= 0 arrays_in_records__record_with_arrays__counter__position))

(declare-const arrays_in_records__record_with_arrays__first_array__first__bit Int)

(declare-const arrays_in_records__record_with_arrays__first_array__last__bit Int)

(declare-const arrays_in_records__record_with_arrays__first_array__position Int)

;; arrays_in_records__record_with_arrays__first_array__first__bit_axiom
  (assert
  (<= 0 arrays_in_records__record_with_arrays__first_array__first__bit))

;; arrays_in_records__record_with_arrays__first_array__last__bit_axiom
  (assert
  (< arrays_in_records__record_with_arrays__first_array__first__bit arrays_in_records__record_with_arrays__first_array__last__bit))

;; arrays_in_records__record_with_arrays__first_array__position_axiom
  (assert
  (<= 0 arrays_in_records__record_with_arrays__first_array__position))

(declare-const arrays_in_records__record_with_arrays__second_array__first__bit Int)

(declare-const arrays_in_records__record_with_arrays__second_array__last__bit Int)

(declare-const arrays_in_records__record_with_arrays__second_array__position Int)

;; arrays_in_records__record_with_arrays__second_array__first__bit_axiom
  (assert
  (<= 0 arrays_in_records__record_with_arrays__second_array__first__bit))

;; arrays_in_records__record_with_arrays__second_array__last__bit_axiom
  (assert
  (< arrays_in_records__record_with_arrays__second_array__first__bit 
  arrays_in_records__record_with_arrays__second_array__last__bit))

;; arrays_in_records__record_with_arrays__second_array__position_axiom
  (assert
  (<= 0 arrays_in_records__record_with_arrays__second_array__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((record_with_arrays__ref 0))
(((record_with_arrays__refqtmk (record_with_arrays__content us_rep)))))
(define-fun record_with_arrays__ref_record_with_arrays__content__projection ((a record_with_arrays__ref)) us_rep 
  (record_with_arrays__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_166 Int)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (<= 0 1001)) (in_range temp___expr_166)))

(define-fun dynamic_invariant1 ((temp___expr_173 Int)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (=>
                                     (or (= temp___is_init_169 true)
                                     (<= (- 23) 69)) (in_range1
                                     temp___expr_173)))

(declare-const rliteral value)

;; rliteral_axiom
  (assert (= (valueqtint rliteral) 23))

(declare-const rliteral1 value)

;; rliteral_axiom
  (assert (= (valueqtint rliteral1) 42))

(assert
;; defqtvc
 ;; File "arrays_in_records.adb", line 131, characters 0-0
  (not
  (forall ((a__split_fields us_split_fields)
  (a__split_fields1 us_split_fields) (a__split_fields2 us_split_fields))
  (=>
  (= a__split_fields1 (us_split_fieldsqtmk
                      (rec__arrays_in_records__record_with_arrays__counter
                      a__split_fields)
                      (store (rec__arrays_in_records__record_with_arrays__first_array
                             a__split_fields) 17 rliteral)
                      (rec__arrays_in_records__record_with_arrays__second_array
                      a__split_fields)))
  (=>
  (= a__split_fields2 (us_split_fieldsqtmk
                      (rec__arrays_in_records__record_with_arrays__counter
                      a__split_fields1)
                      (store (rec__arrays_in_records__record_with_arrays__first_array
                             a__split_fields1) 5 rliteral1)
                      (rec__arrays_in_records__record_with_arrays__second_array
                      a__split_fields1)))
  (not
  (= (to_rep1
     (select (rec__arrays_in_records__record_with_arrays__first_array
             a__split_fields2) 17)) 23)))))))
(check-sat)
(exit)
