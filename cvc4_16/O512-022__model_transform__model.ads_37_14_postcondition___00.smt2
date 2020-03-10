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

(declare-sort uml_state_access 0)

(declare-fun uml_state_accessqtint (uml_state_access) Int)

;; uml_state_access'axiom
  (assert
  (forall ((i uml_state_access))
  (and (<= 0 (uml_state_accessqtint i)) (<= (uml_state_accessqtint i) 100))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (uml_state_access uml_state_access) Bool)

(declare-const dummy uml_state_access)

(declare-datatypes ((uml_state_access__ref 0))
(((uml_state_access__refqtmk (uml_state_access__content uml_state_access)))))
(define-fun uml_state_access__ref_uml_state_access__content__projection ((a uml_state_access__ref)) uml_state_access 
  (uml_state_access__content a))

(define-fun to_rep ((x uml_state_access)) Int (uml_state_accessqtint x))

(declare-fun of_rep (Int) uml_state_access)

;; inversion_axiom
  (assert
  (forall ((x uml_state_access))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x uml_state_access)) (! (in_range
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__model__uml_transition__from_data uml_state_access)(rec__model__uml_transition__to_data uml_state_access)))))
(define-fun us_split_fields_rec__model__uml_transition__from_data__projection ((a us_split_fields)) uml_state_access 
  (rec__model__uml_transition__from_data a))

(define-fun us_split_fields_rec__model__uml_transition__to_data__projection ((a us_split_fields)) uml_state_access 
  (rec__model__uml_transition__to_data a))

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
                        (= (to_rep
                           (rec__model__uml_transition__from_data
                           (us_split_fields1 a))) (to_rep
                                                  (rec__model__uml_transition__from_data
                                                  (us_split_fields1 b))))
                        (= (to_rep
                           (rec__model__uml_transition__to_data
                           (us_split_fields1 a))) (to_rep
                                                  (rec__model__uml_transition__to_data
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

(declare-const model__uml_transition__from_data__first__bit Int)

(declare-const model__uml_transition__from_data__last__bit Int)

(declare-const model__uml_transition__from_data__position Int)

;; model__uml_transition__from_data__first__bit_axiom
  (assert (<= 0 model__uml_transition__from_data__first__bit))

;; model__uml_transition__from_data__last__bit_axiom
  (assert
  (< model__uml_transition__from_data__first__bit model__uml_transition__from_data__last__bit))

;; model__uml_transition__from_data__position_axiom
  (assert (<= 0 model__uml_transition__from_data__position))

(declare-const model__uml_transition__to_data__first__bit Int)

(declare-const model__uml_transition__to_data__last__bit Int)

(declare-const model__uml_transition__to_data__position Int)

;; model__uml_transition__to_data__first__bit_axiom
  (assert (<= 0 model__uml_transition__to_data__first__bit))

;; model__uml_transition__to_data__last__bit_axiom
  (assert
  (< model__uml_transition__to_data__first__bit model__uml_transition__to_data__last__bit))

;; model__uml_transition__to_data__position_axiom
  (assert (<= 0 model__uml_transition__to_data__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((uml_transition__ref 0))
(((uml_transition__refqtmk (uml_transition__content us_rep)))))
(define-fun uml_transition__ref_uml_transition__content__projection ((a uml_transition__ref)) us_rep 
  (uml_transition__content a))

(declare-fun from (us_rep) Int)

(declare-fun from__function_guard (Int us_rep) Bool)

(define-fun dynamic_invariant ((temp___expr_196 Int)
  (temp___is_init_192 Bool) (temp___skip_constant_193 Bool)
  (temp___do_toplevel_194 Bool)
  (temp___do_typ_inv_195 Bool)) Bool (=>
                                     (or (= temp___is_init_192 true)
                                     (<= 0 100)) (in_range temp___expr_196)))

;; from__post_axiom
  (assert
  (forall ((self us_rep))
  (! (let ((result (from self)))
     (=> (from__function_guard result self) (dynamic_invariant result true
     false true true))) :pattern ((from self)) )))

;; from__def_axiom
  (assert
  (forall ((self us_rep))
  (! (= (from self) (to_rep
                    (rec__model__uml_transition__from_data
                    (us_split_fields1 self)))) :pattern ((from self)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const val__ Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(assert
;; defqtvc
 ;; File "model.ads", line 34, characters 0-0
  (not
  (forall ((self__split_fields us_split_fields) (o uml_state_access)
  (self__split_fields1 us_split_fields))
  (=> (dynamic_invariant val__ true false true true)
  (=> (= (to_rep o) val__)
  (=>
  (= self__split_fields1 (us_split_fieldsqtmk o
                         (rec__model__uml_transition__to_data
                         self__split_fields)))
  (=>
  (forall ((self__split_fields2 us_split_fields)) (from__function_guard
  (from (us_repqtmk self__split_fields2)) (us_repqtmk self__split_fields2)))
  (= (from (us_repqtmk self__split_fields1)) val__))))))))
(check-sat)
(exit)
