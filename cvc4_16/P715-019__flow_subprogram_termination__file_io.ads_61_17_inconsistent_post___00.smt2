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

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-sort us_rep 0)

(declare-fun bool_eq (us_rep us_rep) Bool)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-const dummy us_rep)

(declare-datatypes ((file__ref 0))
(((file__refqtmk (file__content us_rep)))))
(define-fun file__ref_file__content__projection ((a file__ref)) us_rep 
  (file__content a))

(declare-fun size (us_rep) Int)

(declare-fun size__function_guard (Int us_rep) Bool)

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

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

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

;; size__post_axiom
  (assert (forall ((f us_rep)) (! (in_range (size f)) :pattern ((size f)) )))

(declare-fun index (us_rep) Int)

(declare-fun index__function_guard (Int us_rep) Bool)

;; index__post_axiom
  (assert
  (forall ((f us_rep)) (! (in_range (index f)) :pattern ((index f)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort character 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq2 (character character) Bool)

(declare-const dummy2 character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort read_status 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq3 (read_status read_status) Bool)

(declare-const dummy3 read_status)

(declare-datatypes ((read_status__ref 0))
(((read_status__refqtmk (read_status__content read_status)))))
(define-fun read_status__ref_read_status__content__projection ((a read_status__ref)) read_status 
  (read_status__content a))

(declare-fun to_rep1 (read_status) Int)

(declare-fun of_rep1 (Int) read_status)

;; inversion_axiom
  (assert
  (forall ((x read_status))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x read_status)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__file_io__read_result__status read_status)))))
(define-fun us_split_discrs_rec__file_io__read_result__status__projection ((a us_split_discrs)) read_status 
  (rec__file_io__read_result__status a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__file_io__read_result__c character)))))
(define-fun us_split_fields_rec__file_io__read_result__c__projection ((a us_split_fields)) character 
  (rec__file_io__read_result__c a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun file_io__read_result__c__pred ((a us_rep1)) Bool (= (to_rep1
                                                                (rec__file_io__read_result__status
                                                                (us_split_discrs1
                                                                a))) 0))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep1
                            (rec__file_io__read_result__status
                            (us_split_discrs1 a))) (to_rep1
                                                   (rec__file_io__read_result__status
                                                   (us_split_discrs1 b))))
                         (=> (file_io__read_result__c__pred a)
                         (= (to_rep
                            (rec__file_io__read_result__c
                            (us_split_fields1 a))) (to_rep
                                                   (rec__file_io__read_result__c
                                                   (us_split_fields1 b))))))
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

(declare-const file_io__read_result__status__first__bit Int)

(declare-const file_io__read_result__status__last__bit Int)

(declare-const file_io__read_result__status__position Int)

;; file_io__read_result__status__first__bit_axiom
  (assert (<= 0 file_io__read_result__status__first__bit))

;; file_io__read_result__status__last__bit_axiom
  (assert
  (< file_io__read_result__status__first__bit file_io__read_result__status__last__bit))

;; file_io__read_result__status__position_axiom
  (assert (<= 0 file_io__read_result__status__position))

(declare-const file_io__read_result__c__first__bit Int)

(declare-const file_io__read_result__c__last__bit Int)

(declare-const file_io__read_result__c__position Int)

;; file_io__read_result__c__first__bit_axiom
  (assert (<= 0 file_io__read_result__c__first__bit))

;; file_io__read_result__c__last__bit_axiom
  (assert
  (< file_io__read_result__c__first__bit file_io__read_result__c__last__bit))

;; file_io__read_result__c__position_axiom
  (assert (<= 0 file_io__read_result__c__position))

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ((read_result__ref 0))
(((read_result__refqtmk (read_result__content us_rep1)))))
(define-fun read_result__ref_read_result__content__projection ((a read_result__ref)) us_rep1 
  (read_result__content a))

(declare-const r__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun default_initial_assumption ((temp___expr_176 us_rep1)
  (temp___skip_top_level_177 Bool)) Bool (= (to_rep1
                                            (rec__file_io__read_result__status
                                            (us_split_discrs1
                                            temp___expr_176))) 2))

(define-fun dynamic_invariant1 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range1 temp___expr_74)))

(define-fun dynamic_invariant2 ((temp___expr_167 Int)
  (temp___is_init_163 Bool) (temp___skip_constant_164 Bool)
  (temp___do_toplevel_165 Bool)
  (temp___do_typ_inv_166 Bool)) Bool (=>
                                     (or (= temp___is_init_163 true)
                                     (<= 0 2)) (in_range2 temp___expr_167)))

(assert
;; defqtvc
 ;; File "file_io.ads", line 58, characters 0-0
  (not
  (forall ((f us_rep) (f1 us_rep) (r__split_discrs read_status))
  (=> (not (= r__attr__constrained true))
  (=> (forall ((f2 us_rep)) (size__function_guard (size f2) f2))
  (=> (forall ((f2 us_rep)) (size__function_guard (size f2) f2))
  (=> (forall ((f2 us_rep)) (index__function_guard (index f2) f2))
  (=> (forall ((f2 us_rep)) (size__function_guard (size f2) f2))
  (=> (forall ((f2 us_rep)) (index__function_guard (index f2) f2))
  (=> (forall ((f2 us_rep)) (index__function_guard (index f2) f2))
  (=> (forall ((f2 us_rep)) (index__function_guard (index f2) f2))
  (=> (forall ((f2 us_rep)) (index__function_guard (index f2) f2))
  (not
  (and
  (and (and (= (size f1) (size f)) (<= (index f1) (size f1)))
  (or (not (= (to_rep1 r__split_discrs) 0)) (= (index f1) (+ (index f) 1))))
  (or (= (to_rep1 r__split_discrs) 0) (= (index f1) (index f)))))))))))))))))
(check-sat)