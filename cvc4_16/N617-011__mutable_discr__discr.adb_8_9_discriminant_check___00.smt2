;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
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

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

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

(declare-const c Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__discr__no_default__c natural)))))
(define-fun us_split_discrs_rec__discr__no_default__c__projection ((a us_split_discrs)) natural 
  (rec__discr__no_default__c a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_discrs1 us_split_discrs)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__discr__no_default__c (us_split_discrs1 a))) 
                   (to_rep (rec__discr__no_default__c (us_split_discrs1 b))))
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

(declare-const discr__no_default__c__first__bit Int)

(declare-const discr__no_default__c__last__bit Int)

(declare-const discr__no_default__c__position Int)

;; discr__no_default__c__first__bit_axiom
  (assert (<= 0 discr__no_default__c__first__bit))

;; discr__no_default__c__last__bit_axiom
  (assert
  (< discr__no_default__c__first__bit discr__no_default__c__last__bit))

;; discr__no_default__c__position_axiom
  (assert (<= 0 discr__no_default__c__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((no_default__ref 0))
(((no_default__refqtmk (no_default__content us_rep)))))
(define-fun no_default__ref_no_default__content__projection ((a no_default__ref)) us_rep 
  (no_default__content a))

(declare-const d__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun in_range1 ((rec__discr__no_default__c1 Int)
  (a us_rep)) Bool (= rec__discr__no_default__c1 (to_rep
                                                 (rec__discr__no_default__c
                                                 (us_split_discrs1 a)))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const discr__no_default__c__first__bit1 Int)

(declare-const discr__no_default__c__last__bit1 Int)

(declare-const discr__no_default__c__position1 Int)

;; discr__no_default__c__first__bit_axiom
  (assert (<= 0 discr__no_default__c__first__bit1))

;; discr__no_default__c__last__bit_axiom
  (assert
  (< discr__no_default__c__first__bit1 discr__no_default__c__last__bit1))

;; discr__no_default__c__position_axiom
  (assert (<= 0 discr__no_default__c__position1))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content us_rep)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) us_rep (t1b__content
                                                                    a))

(define-fun in_range2 ((rec__discr__no_default__c1 Int)
  (a us_rep)) Bool (= rec__discr__no_default__c1 (to_rep
                                                 (rec__discr__no_default__c
                                                 (us_split_discrs1 a)))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const discr__no_default__c__first__bit2 Int)

(declare-const discr__no_default__c__last__bit2 Int)

(declare-const discr__no_default__c__position2 Int)

;; discr__no_default__c__first__bit_axiom
  (assert (<= 0 discr__no_default__c__first__bit2))

;; discr__no_default__c__last__bit_axiom
  (assert
  (< discr__no_default__c__first__bit2 discr__no_default__c__last__bit2))

;; discr__no_default__c__position_axiom
  (assert (<= 0 discr__no_default__c__position2))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((t2b__ref 0))
(((t2b__refqtmk (t2b__content us_rep)))))
(define-fun t2b__ref_t2b__content__projection ((a t2b__ref)) us_rep (t2b__content
                                                                    a))

(define-fun in_range3 ((rec__discr__no_default__c1 Int)
  (a us_rep)) Bool (= rec__discr__no_default__c1 (to_rep
                                                 (rec__discr__no_default__c
                                                 (us_split_discrs1 a)))))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const discr__no_default__c__first__bit3 Int)

(declare-const discr__no_default__c__last__bit3 Int)

(declare-const discr__no_default__c__position3 Int)

;; discr__no_default__c__first__bit_axiom
  (assert (<= 0 discr__no_default__c__first__bit3))

;; discr__no_default__c__last__bit_axiom
  (assert
  (< discr__no_default__c__first__bit3 discr__no_default__c__last__bit3))

;; discr__no_default__c__position_axiom
  (assert (<= 0 discr__no_default__c__position3))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((t3b__ref 0))
(((t3b__refqtmk (t3b__content us_rep)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) us_rep (t3b__content
                                                                    a))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 0))

(assert
;; defqtvc
 ;; File "discr.ads", line 8, characters 0-0
  (not
  (forall ((o natural) (o1 natural))
  (=> (dynamic_invariant c true false true true)
  (=> (= (to_rep o) c)
  (=> (= d__split_discrs (us_split_discrsqtmk o))
  (=> (= (to_rep o1) c)
  (=> (= o1 (rec__discr__no_default__c d__split_discrs))
  (=> (= d__split_discrs (us_split_discrsqtmk o1))
  (= rliteral (rec__discr__no_default__c d__split_discrs)))))))))))
(check-sat)