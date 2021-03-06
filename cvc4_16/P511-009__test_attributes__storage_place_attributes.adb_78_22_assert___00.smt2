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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort my_integer 0)

(declare-fun my_integerqtint (my_integer) Int)

;; my_integer'axiom
  (assert
  (forall ((i my_integer))
  (and (<= 1 (my_integerqtint i)) (<= (my_integerqtint i) 10))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (my_integer my_integer) Bool)

(declare-const dummy1 my_integer)

(declare-datatypes ((my_integer__ref 0))
(((my_integer__refqtmk (my_integer__content my_integer)))))
(define-fun my_integer__ref_my_integer__content__projection ((a my_integer__ref)) my_integer 
  (my_integer__content a))

(define-fun to_rep1 ((x my_integer)) Int (my_integerqtint x))

(declare-fun of_rep1 (Int) my_integer)

;; inversion_axiom
  (assert
  (forall ((x my_integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x my_integer)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__storage_place_attributes__r2__d1 my_integer)))))
(define-fun us_split_discrs_rec__storage_place_attributes__r2__d1__projection ((a us_split_discrs)) my_integer 
  (rec__storage_place_attributes__r2__d1 a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__storage_place_attributes__r2__d3 integer)(rec__storage_place_attributes__r2__d2 Bool)))))
(define-fun us_split_fields_rec__storage_place_attributes__r2__d3__projection ((a us_split_fields)) integer 
  (rec__storage_place_attributes__r2__d3 a))

(define-fun us_split_fields_rec__storage_place_attributes__r2__d2__projection ((a us_split_fields)) Bool 
  (rec__storage_place_attributes__r2__d2 a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun storage_place_attributes__r2__d2__pred ((a us_rep)) Bool (= 
  (to_rep1 (rec__storage_place_attributes__r2__d1 (us_split_discrs1 a))) 5))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1
                           (rec__storage_place_attributes__r2__d1
                           (us_split_discrs1 a))) (to_rep1
                                                  (rec__storage_place_attributes__r2__d1
                                                  (us_split_discrs1 b))))
                        (and
                        (= (to_rep
                           (rec__storage_place_attributes__r2__d3
                           (us_split_fields1 a))) (to_rep
                                                  (rec__storage_place_attributes__r2__d3
                                                  (us_split_fields1 b))))
                        (=> (storage_place_attributes__r2__d2__pred a)
                        (= (ite (rec__storage_place_attributes__r2__d2
                                (us_split_fields1 a)) 1 0) (ite (rec__storage_place_attributes__r2__d2
                                                                (us_split_fields1
                                                                b)) 1 0)))))
                   true false))

(define-fun in_range3 ((rec__storage_place_attributes__r2__d11 Int)
  (a us_split_discrs)) Bool (= rec__storage_place_attributes__r2__d11 
  (to_rep1 (rec__storage_place_attributes__r2__d1 a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const storage_place_attributes__r2__d1__first__bit Int)

(declare-const storage_place_attributes__r2__d1__last__bit Int)

(declare-const storage_place_attributes__r2__d1__position Int)

;; storage_place_attributes__r2__d1__first__bit_axiom
  (assert (<= 0 storage_place_attributes__r2__d1__first__bit))

;; storage_place_attributes__r2__d1__last__bit_axiom
  (assert
  (< storage_place_attributes__r2__d1__first__bit storage_place_attributes__r2__d1__last__bit))

;; storage_place_attributes__r2__d1__position_axiom
  (assert (<= 0 storage_place_attributes__r2__d1__position))

(declare-const storage_place_attributes__r2__d3__first__bit Int)

(declare-const storage_place_attributes__r2__d3__last__bit Int)

(declare-const storage_place_attributes__r2__d3__position Int)

;; storage_place_attributes__r2__d3__first__bit_axiom
  (assert (<= 0 storage_place_attributes__r2__d3__first__bit))

;; storage_place_attributes__r2__d3__last__bit_axiom
  (assert
  (< storage_place_attributes__r2__d3__first__bit storage_place_attributes__r2__d3__last__bit))

;; storage_place_attributes__r2__d3__position_axiom
  (assert (<= 0 storage_place_attributes__r2__d3__position))

(declare-const storage_place_attributes__r2__d2__first__bit Int)

(declare-const storage_place_attributes__r2__d2__last__bit Int)

(declare-const storage_place_attributes__r2__d2__position Int)

;; storage_place_attributes__r2__d2__first__bit_axiom
  (assert (<= 0 storage_place_attributes__r2__d2__first__bit))

;; storage_place_attributes__r2__d2__last__bit_axiom
  (assert
  (< storage_place_attributes__r2__d2__first__bit storage_place_attributes__r2__d2__last__bit))

;; storage_place_attributes__r2__d2__position_axiom
  (assert (<= 0 storage_place_attributes__r2__d2__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((r2__ref 0))
(((r2__refqtmk (r2__content us_rep)))))
(define-fun r2__ref_r2__content__projection ((a r2__ref)) us_rep (r2__content
                                                                 a))

(define-fun default_initial_assumption ((temp___expr_197 us_rep)
  (temp___skip_top_level_198 Bool)) Bool (and
                                         (= (to_rep1
                                            (rec__storage_place_attributes__r2__d1
                                            (us_split_discrs1
                                            temp___expr_197))) 1)
                                         (and
                                         (= (to_rep
                                            (rec__storage_place_attributes__r2__d3
                                            (us_split_fields1
                                            temp___expr_197))) 0)
                                         (=>
                                         (storage_place_attributes__r2__d2__pred
                                         temp___expr_197)
                                         (= (rec__storage_place_attributes__r2__d2
                                            (us_split_fields1
                                            temp___expr_197)) (distinct 0 0))))))

(declare-const x us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant1 ((temp___expr_180 Int)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (=>
                                     (or (= temp___is_init_176 true)
                                     (<= 1 10)) (in_range2 temp___expr_180)))

(assert
;; defqtvc
 ;; File "storage_place_attributes.adb", line 76, characters 0-0
  (not (<= 0 storage_place_attributes__r2__d1__first__bit)))
(check-sat)
(exit)
