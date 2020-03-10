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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 10000))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (index_type index_type) Bool)

(declare-const dummy1 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun to_rep1 ((x index_type)) Int (index_typeqtint x))

(declare-fun of_rep1 (Int) index_type)

;; inversion_axiom
  (assert
  (forall ((x index_type))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x index_type)) (! (in_range1
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__vectors__cursor__container_id natural)(rec__vectors__cursor__container_sig natural)(rec__vectors__cursor__last_index index_type)(rec__vectors__cursor__index index_type)))))
(define-fun us_split_fields_rec__vectors__cursor__container_id__projection ((a us_split_fields)) natural 
  (rec__vectors__cursor__container_id a))

(define-fun us_split_fields_rec__vectors__cursor__container_sig__projection ((a us_split_fields)) natural 
  (rec__vectors__cursor__container_sig a))

(define-fun us_split_fields_rec__vectors__cursor__last_index__projection ((a us_split_fields)) index_type 
  (rec__vectors__cursor__last_index a))

(define-fun us_split_fields_rec__vectors__cursor__index__projection ((a us_split_fields)) index_type 
  (rec__vectors__cursor__index a))

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
                        (= (to_rep
                           (rec__vectors__cursor__container_id
                           (us_split_fields1 a))) (to_rep
                                                  (rec__vectors__cursor__container_id
                                                  (us_split_fields1 b))))
                        (= (to_rep
                           (rec__vectors__cursor__container_sig
                           (us_split_fields1 a))) (to_rep
                                                  (rec__vectors__cursor__container_sig
                                                  (us_split_fields1 b)))))
                        (and
                        (= (to_rep1
                           (rec__vectors__cursor__last_index
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__vectors__cursor__last_index
                                                  (us_split_fields1 b))))
                        (= (to_rep1
                           (rec__vectors__cursor__index (us_split_fields1 a))) 
                        (to_rep1
                        (rec__vectors__cursor__index (us_split_fields1 b))))))
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

(declare-const vectors__cursor__container_id__first__bit Int)

(declare-const vectors__cursor__container_id__last__bit Int)

(declare-const vectors__cursor__container_id__position Int)

;; vectors__cursor__container_id__first__bit_axiom
  (assert (<= 0 vectors__cursor__container_id__first__bit))

;; vectors__cursor__container_id__last__bit_axiom
  (assert
  (< vectors__cursor__container_id__first__bit vectors__cursor__container_id__last__bit))

;; vectors__cursor__container_id__position_axiom
  (assert (<= 0 vectors__cursor__container_id__position))

(declare-const vectors__cursor__container_sig__first__bit Int)

(declare-const vectors__cursor__container_sig__last__bit Int)

(declare-const vectors__cursor__container_sig__position Int)

;; vectors__cursor__container_sig__first__bit_axiom
  (assert (<= 0 vectors__cursor__container_sig__first__bit))

;; vectors__cursor__container_sig__last__bit_axiom
  (assert
  (< vectors__cursor__container_sig__first__bit vectors__cursor__container_sig__last__bit))

;; vectors__cursor__container_sig__position_axiom
  (assert (<= 0 vectors__cursor__container_sig__position))

(declare-const vectors__cursor__last_index__first__bit Int)

(declare-const vectors__cursor__last_index__last__bit Int)

(declare-const vectors__cursor__last_index__position Int)

;; vectors__cursor__last_index__first__bit_axiom
  (assert (<= 0 vectors__cursor__last_index__first__bit))

;; vectors__cursor__last_index__last__bit_axiom
  (assert
  (< vectors__cursor__last_index__first__bit vectors__cursor__last_index__last__bit))

;; vectors__cursor__last_index__position_axiom
  (assert (<= 0 vectors__cursor__last_index__position))

(declare-const vectors__cursor__index__first__bit Int)

(declare-const vectors__cursor__index__last__bit Int)

(declare-const vectors__cursor__index__position Int)

;; vectors__cursor__index__first__bit_axiom
  (assert (<= 0 vectors__cursor__index__first__bit))

;; vectors__cursor__index__last__bit_axiom
  (assert
  (< vectors__cursor__index__first__bit vectors__cursor__index__last__bit))

;; vectors__cursor__index__position_axiom
  (assert (<= 0 vectors__cursor__index__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((cursor__ref 0))
(((cursor__refqtmk (cursor__content us_rep)))))
(define-fun cursor__ref_cursor__content__projection ((a cursor__ref)) us_rep 
  (cursor__content a))

(declare-const no_element us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(define-fun dynamic_invariant1 ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (<= 1 10000)) (in_range1
                                     temp___expr_179)))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 0))

(declare-const rliteral1 index_type)

;; rliteral_axiom
  (assert (= (index_typeqtint rliteral1) 1))

;; no_element__def_axiom
  (assert
  (= no_element (us_repqtmk
                (us_split_fieldsqtmk rliteral rliteral rliteral1 rliteral1))))

(assert
;; defqtvc
 ;; File "vectors.ads", line 34, characters 0-0
  (not
  (forall ((position__split_fields us_split_fields) (o Int) (o1 Int)
  (spark__branch Bool) (o2 Int))
  (=>
  (= (us_repqtmk (us_split_fieldsqtmk rliteral rliteral rliteral1 rliteral1)) 
  no_element)
  (=>
  (= (to_rep1 (rec__vectors__cursor__last_index position__split_fields)) o)
  (=> (= (to_rep1 (rec__vectors__cursor__index position__split_fields)) o1)
  (=> (= spark__branch (ite (< o1 o) true false))
  (=> (= spark__branch true)
  (=> (= (to_rep1 (rec__vectors__cursor__index position__split_fields)) o2)
  (in_range1 (+ o2 1)))))))))))
(check-sat)
(exit)
