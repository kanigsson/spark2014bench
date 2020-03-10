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

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-fun hide (Int) Int)

(declare-fun hide__function_guard (Int Int) Bool)

;; hide__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (hide x)))
     (=> (hide__function_guard result x) (dynamic_invariant result true false
     true true)))) :pattern ((hide x)) )))

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

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__tagged_component_check__s__p3__root__f natural)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__tagged_component_check__s__p3__root__f__projection ((a us_split_fields)) natural 
  (rec__tagged_component_check__s__p3__root__f a))

(define-fun us_split_fields_rec__ext____35__projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__35__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_fields__35__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__35__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__tagged_component_check__s__p3__root__f
                           (us_split_fields1 a))) (to_rep
                                                  (rec__tagged_component_check__s__p3__root__f
                                                  (us_split_fields1 b))))
                   true false))

(declare-fun us_dispatch_eq (us_rep us_rep) Bool)

(declare-const us_tag Int)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const tagged_component_check__s__p3__root__f__first__bit Int)

(declare-const tagged_component_check__s__p3__root__f__last__bit Int)

(declare-const tagged_component_check__s__p3__root__f__position Int)

;; tagged_component_check__s__p3__root__f__first__bit_axiom
  (assert (<= 0 tagged_component_check__s__p3__root__f__first__bit))

;; tagged_component_check__s__p3__root__f__last__bit_axiom
  (assert
  (< tagged_component_check__s__p3__root__f__first__bit tagged_component_check__s__p3__root__f__last__bit))

;; tagged_component_check__s__p3__root__f__position_axiom
  (assert (<= 0 tagged_component_check__s__p3__root__f__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((root__ref 0))
(((root__refqtmk (root__content us_rep)))))
(define-fun root__ref_root__content__13__projection ((a root__ref)) us_rep 
  (root__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__tagged_component_check__s__p3__c__g natural)(rec__tagged_component_check__s__p3__root__f1 natural)(rec__ext__1 us_private)))))
(define-fun us_split_fields_rec__tagged_component_check__s__p3__c__g__projection ((a us_split_fields2)) natural 
  (rec__tagged_component_check__s__p3__c__g a))

(define-fun us_split_fields_rec__tagged_component_check__s__p3__root__f__2__projection ((a us_split_fields2)) natural 
  (rec__tagged_component_check__s__p3__root__f1 a))

(define-fun us_split_fields_rec__ext____36__projection ((a us_split_fields2)) us_private 
  (rec__ext__1 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__36__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)(attr__tag1 Int)))))
(define-fun us_rep___split_fields__36__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun us_rep_attr__tag__36__projection ((a us_rep1)) Int (attr__tag1 a))

(declare-fun hide_ext__ (natural us_private) us_private)

(declare-fun extract__tagged_component_check__s__p3__c__g (us_private) natural)

;; extract__tagged_component_check__s__p3__c__g__conv
  (assert
  (forall ((tagged_component_check__s__p3__c__g natural))
  (forall ((rec__ext__2 us_private))
  (= (extract__tagged_component_check__s__p3__c__g
     (hide_ext__ tagged_component_check__s__p3__c__g rec__ext__2)) tagged_component_check__s__p3__c__g))))

(declare-fun extract__ext__ (us_private) us_private)

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk
                                         (us_split_fieldsqtmk
                                         (rec__tagged_component_check__s__p3__root__f1
                                         (us_split_fields3 a))
                                         (hide_ext__
                                         (rec__tagged_component_check__s__p3__c__g
                                         (us_split_fields3 a))
                                         (rec__ext__1 (us_split_fields3 a))))
                                         (attr__tag1 a)))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1
                                         (us_split_fieldsqtmk1
                                         (extract__tagged_component_check__s__p3__c__g
                                         (rec__ext__ (us_split_fields1 r)))
                                         (rec__tagged_component_check__s__p3__root__f
                                         (us_split_fields1 r))
                                         (extract__ext__
                                         (rec__ext__ (us_split_fields1 r))))
                                         (attr__tag r)))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__tagged_component_check__s__p3__c__g
                            (us_split_fields3 a))) (to_rep
                                                   (rec__tagged_component_check__s__p3__c__g
                                                   (us_split_fields3 b))))
                         (= (to_rep
                            (rec__tagged_component_check__s__p3__root__f1
                            (us_split_fields3 a))) (to_rep
                                                   (rec__tagged_component_check__s__p3__root__f1
                                                   (us_split_fields3 b)))))
                    true false))

(declare-const us_tag1 Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const tagged_component_check__s__p3__c__g__first__bit Int)

(declare-const tagged_component_check__s__p3__c__g__last__bit Int)

(declare-const tagged_component_check__s__p3__c__g__position Int)

;; tagged_component_check__s__p3__c__g__first__bit_axiom
  (assert (<= 0 tagged_component_check__s__p3__c__g__first__bit))

;; tagged_component_check__s__p3__c__g__last__bit_axiom
  (assert
  (< tagged_component_check__s__p3__c__g__first__bit tagged_component_check__s__p3__c__g__last__bit))

;; tagged_component_check__s__p3__c__g__position_axiom
  (assert (<= 0 tagged_component_check__s__p3__c__g__position))

(declare-const tagged_component_check__s__p3__root__f__first__bit1 Int)

(declare-const tagged_component_check__s__p3__root__f__last__bit1 Int)

(declare-const tagged_component_check__s__p3__root__f__position1 Int)

;; tagged_component_check__s__p3__root__f__first__bit_axiom
  (assert (<= 0 tagged_component_check__s__p3__root__f__first__bit1))

;; tagged_component_check__s__p3__root__f__last__bit_axiom
  (assert
  (< tagged_component_check__s__p3__root__f__first__bit1 tagged_component_check__s__p3__root__f__last__bit1))

;; tagged_component_check__s__p3__root__f__position_axiom
  (assert (<= 0 tagged_component_check__s__p3__root__f__position1))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((c__ref 0))
(((c__refqtmk (c__content us_rep1)))))
(define-fun c__ref_c__content__13__projection ((a c__ref)) us_rep1 (c__content
                                                                   a))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

;; temp___result_454'def
  (assert (hide__function_guard (hide 34) 34))

(define-fun default_initial_assumption ((temp___expr_452 us_rep)
  (temp___skip_top_level_453 Bool)) Bool (and
                                         (= (attr__tag temp___expr_452) 
                                         us_tag)
                                         (= (to_rep
                                            (rec__tagged_component_check__s__p3__root__f
                                            (us_split_fields1
                                            temp___expr_452))) (hide 34))))

;; temp___result_462'def
  (assert (hide__function_guard (hide 35) 35))

;; temp___result_463'def
  (assert (hide__function_guard (hide 34) 34))

(define-fun default_initial_assumption1 ((temp___expr_460 us_rep1)
  (temp___skip_top_level_461 Bool)) Bool (and
                                         (= (attr__tag1 temp___expr_460) 
                                         us_tag1)
                                         (and
                                         (= (to_rep
                                            (rec__tagged_component_check__s__p3__c__g
                                            (us_split_fields3
                                            temp___expr_460))) (hide 35))
                                         (= (to_rep
                                            (rec__tagged_component_check__s__p3__root__f1
                                            (us_split_fields3
                                            temp___expr_460))) (hide 34)))))

(assert
;; defqtvc
 ;; File "/home/kanig/dev/spark2014/benchmark_script/data/tmp-test-PA12-001__default_checks_on_private-25155/src/gnatprove/tagged_component_check__s__p3__c.mlw", line 685, characters 5-8
  (not
  (let ((o (hide 35)))
  (=>
  (and (hide__function_guard o 35) (dynamic_invariant o true false true
  true)) (in_range o)))))
(check-sat)
(exit)
