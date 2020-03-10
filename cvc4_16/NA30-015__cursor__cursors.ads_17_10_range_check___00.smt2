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

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (count_type count_type) Bool)

(declare-const dummy count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun to_rep ((x count_type)) Int (count_typeqtint x))

(declare-fun of_rep (Int) count_type)

;; inversion_axiom
  (assert
  (forall ((x count_type))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x count_type)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__cursors__l__cursor__node count_type)))))
(define-fun us_split_fields_rec__cursors__l__cursor__node__projection ((a us_split_fields)) count_type 
  (rec__cursors__l__cursor__node a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__cursors__l__cursor__node
                           (us_split_fields1 a))) (to_rep
                                                  (rec__cursors__l__cursor__node
                                                  (us_split_fields1 b))))
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

(declare-const cursors__l__cursor__node__first__bit Int)

(declare-const cursors__l__cursor__node__last__bit Int)

(declare-const cursors__l__cursor__node__position Int)

;; cursors__l__cursor__node__first__bit_axiom
  (assert (<= 0 cursors__l__cursor__node__first__bit))

;; cursors__l__cursor__node__last__bit_axiom
  (assert
  (< cursors__l__cursor__node__first__bit cursors__l__cursor__node__last__bit))

;; cursors__l__cursor__node__position_axiom
  (assert (<= 0 cursors__l__cursor__node__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((cursor__ref 0))
(((cursor__refqtmk (cursor__content us_rep)))))
(define-fun cursor__ref_cursor__content__projection ((a cursor__ref)) us_rep 
  (cursor__content a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__cursors__r__b Bool)))))
(define-fun us_split_discrs_rec__cursors__r__b__projection ((a us_split_discrs)) Bool 
  (rec__cursors__r__b a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__cursors__r__c us_rep)))))
(define-fun us_split_fields_rec__cursors__r__c__projection ((a us_split_fields2)) us_rep 
  (rec__cursors__r__c a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs1 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__3__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun cursors__r__c__pred ((a us_rep1)) Bool (= (ite (rec__cursors__r__b
                                                           (us_split_discrs1
                                                           a)) 1 0) 1))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (ite (rec__cursors__r__b (us_split_discrs1 a)) 1 0) (ite 
                         (rec__cursors__r__b (us_split_discrs1 b)) 1 0))
                         (=> (cursors__r__c__pred a)
                         (= (bool_eq
                            (rec__cursors__r__c (us_split_fields3 a))
                            (rec__cursors__r__c (us_split_fields3 b))) true)))
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

(declare-const cursors__r__b__first__bit Int)

(declare-const cursors__r__b__last__bit Int)

(declare-const cursors__r__b__position Int)

;; cursors__r__b__first__bit_axiom
  (assert (<= 0 cursors__r__b__first__bit))

;; cursors__r__b__last__bit_axiom
  (assert (< cursors__r__b__first__bit cursors__r__b__last__bit))

;; cursors__r__b__position_axiom
  (assert (<= 0 cursors__r__b__position))

(declare-const cursors__r__c__first__bit Int)

(declare-const cursors__r__c__last__bit Int)

(declare-const cursors__r__c__position Int)

;; cursors__r__c__first__bit_axiom
  (assert (<= 0 cursors__r__c__first__bit))

;; cursors__r__c__last__bit_axiom
  (assert (< cursors__r__c__first__bit cursors__r__c__last__bit))

;; cursors__r__c__position_axiom
  (assert (<= 0 cursors__r__c__position))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((txS__ref 0))
(((txS__refqtmk (txS__content us_rep1)))))
(define-fun txS__ref_txS__content__projection ((a txS__ref)) us_rep1 
  (txS__content a))

(define-fun in_range2 ((rec__cursors__r__b1 Bool)
  (a us_split_discrs)) Bool (= rec__cursors__r__b1 (rec__cursors__r__b a)))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const cursors__r__b__first__bit1 Int)

(declare-const cursors__r__b__last__bit1 Int)

(declare-const cursors__r__b__position1 Int)

;; cursors__r__b__first__bit_axiom
  (assert (<= 0 cursors__r__b__first__bit1))

;; cursors__r__b__last__bit_axiom
  (assert (< cursors__r__b__first__bit1 cursors__r__b__last__bit1))

;; cursors__r__b__position_axiom
  (assert (<= 0 cursors__r__b__position1))

(declare-const cursors__r__c__first__bit1 Int)

(declare-const cursors__r__c__last__bit1 Int)

(declare-const cursors__r__c__position1 Int)

;; cursors__r__c__first__bit_axiom
  (assert (<= 0 cursors__r__c__first__bit1))

;; cursors__r__c__last__bit_axiom
  (assert (< cursors__r__c__first__bit1 cursors__r__c__last__bit1))

;; cursors__r__c__position_axiom
  (assert (<= 0 cursors__r__c__position1))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((r__ref 0))
(((r__refqtmk (r__content us_rep1)))))
(define-fun r__ref_r__content__projection ((a r__ref)) us_rep1 (r__content a))

(declare-const x__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_589 us_rep1)
  (temp___is_init_585 Bool) (temp___skip_constant_586 Bool)
  (temp___do_toplevel_587 Bool)
  (temp___do_typ_inv_588 Bool)) Bool (=>
                                     (not (= temp___skip_constant_586 true))
                                     (in_range2 (distinct 0 0)
                                     (us_split_discrs1 temp___expr_589))))

(define-fun default_initial_assumption ((temp___expr_591 us_rep1)
  (temp___skip_top_level_592 Bool)) Bool (and
                                         (= (rec__cursors__r__b
                                            (us_split_discrs1
                                            temp___expr_591)) (distinct 0 0))
                                         (=> (cursors__r__c__pred
                                         temp___expr_591)
                                         (= (to_rep
                                            (rec__cursors__l__cursor__node
                                            (us_split_fields1
                                            (rec__cursors__r__c
                                            (us_split_fields3
                                            temp___expr_591))))) 0))))

(define-fun dynamic_invariant1 ((temp___expr_236 Int)
  (temp___is_init_232 Bool) (temp___skip_constant_233 Bool)
  (temp___do_toplevel_234 Bool)
  (temp___do_typ_inv_235 Bool)) Bool (=>
                                     (or (= temp___is_init_232 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_236)))

(define-fun default_initial_assumption1 ((temp___expr_250 us_rep)
  (temp___skip_top_level_251 Bool)) Bool (= (to_rep
                                            (rec__cursors__l__cursor__node
                                            (us_split_fields1
                                            temp___expr_250))) 0))

(assert
;; defqtvc
 ;; File "cursors.ads", line 3, characters 0-0
  (not (in_range 0)))
(check-sat)
(exit)
