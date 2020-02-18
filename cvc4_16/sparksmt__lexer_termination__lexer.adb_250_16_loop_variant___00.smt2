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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

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
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(declare-sort character 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

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
  (forall ((x character)) (! (in_range3 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort read_status 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

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
  (forall ((x read_status)) (! (in_range4
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__file_io__read_result__status read_status)))))
(define-fun us_split_discrs_rec__file_io__read_result__status__projection ((a us_split_discrs)) read_status 
  (rec__file_io__read_result__status a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__file_io__read_result__c character)))))
(define-fun us_split_fields_rec__file_io__read_result__c__projection ((a us_split_fields)) character 
  (rec__file_io__read_result__c a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun file_io__read_result__c__pred ((a us_rep)) Bool (= (to_rep1
                                                               (rec__file_io__read_result__status
                                                               (us_split_discrs1
                                                               a))) 0))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
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

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

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

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((read_result__ref 0))
(((read_result__refqtmk (read_result__content us_rep)))))
(define-fun read_result__ref_read_result__content__projection ((a read_result__ref)) us_rep 
  (read_result__content a))

(declare-const current_read__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption ((temp___expr_217 us_rep)
  (temp___skip_top_level_218 Bool)) Bool (= (to_rep1
                                            (rec__file_io__read_result__status
                                            (us_split_discrs1
                                            temp___expr_217))) 2))

(declare-const next_read__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-sort us_rep1 0)

(declare-fun bool_eq1 (us_rep1 us_rep1) Bool)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq5 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ((file__ref 0))
(((file__refqtmk (file__content us_rep1)))))
(define-fun file__ref_file__content__projection ((a file__ref)) us_rep1 
  (file__content a))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-fun local_invariant (us_rep1 Int us_split_fields us_split_discrs Int
  us_split_fields us_split_discrs) Bool)

(declare-fun local_invariant__function_guard (Bool us_rep1 Int
  us_split_fields us_split_discrs Int us_split_fields us_split_discrs) Bool)

(declare-fun size (us_rep1) Int)

(declare-fun size__function_guard (Int us_rep1) Bool)

(declare-fun index (us_rep1) Int)

(declare-fun index__function_guard (Int us_rep1) Bool)

;; local_invariant__def_axiom
  (assert
  (forall ((lexer__the_file us_rep1))
  (forall ((lexer__next_idx Int) (lexer__current_idx Int))
  (forall ((lexer__current_read__fields us_split_fields)
  (lexer__next_read__fields us_split_fields))
  (forall ((lexer__current_read__discrs us_split_discrs)
  (lexer__next_read__discrs us_split_discrs))
  (! (and
     (forall ((lexer__the_file1 us_rep1)) (size__function_guard
     (size lexer__the_file1) lexer__the_file1))
     (and
     (forall ((lexer__the_file1 us_rep1)) (size__function_guard
     (size lexer__the_file1) lexer__the_file1))
     (and
     (forall ((lexer__the_file1 us_rep1)) (index__function_guard
     (index lexer__the_file1) lexer__the_file1))
     (=
     (= (local_invariant lexer__the_file lexer__next_idx
        lexer__current_read__fields lexer__current_read__discrs
        lexer__current_idx lexer__next_read__fields lexer__next_read__discrs) true)
     (and
     (and
     (and
     (and
     (and
     (and (not (= current_read__attr__constrained true))
     (not (= next_read__attr__constrained true)))
     (<= lexer__current_idx (size lexer__the_file)))
     (<= lexer__next_idx (size lexer__the_file)))
     (= lexer__next_idx (index lexer__the_file)))
     (<= lexer__current_idx lexer__next_idx))
     (ite (= (to_rep1
             (rec__file_io__read_result__status
             (us_split_discrs1
             (us_repqtmk lexer__next_read__discrs lexer__next_read__fields)))) 0)
     (and
     (= (to_rep1
        (rec__file_io__read_result__status
        (us_split_discrs1
        (us_repqtmk lexer__current_read__discrs lexer__current_read__fields)))) 0)
     (= lexer__current_idx (- lexer__next_idx 1)))
     (= lexer__current_idx lexer__next_idx))))))) :pattern ((local_invariant
                                                            lexer__the_file
                                                            lexer__next_idx
                                                            lexer__current_read__fields
                                                            lexer__current_read__discrs
                                                            lexer__current_idx
                                                            lexer__next_read__fields
                                                            lexer__next_read__discrs)) ))))))

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(define-fun dynamic_invariant2 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range3 temp___expr_74)))

(define-fun dynamic_invariant3 ((temp___expr_208 Int)
  (temp___is_init_204 Bool) (temp___skip_constant_205 Bool)
  (temp___do_toplevel_206 Bool)
  (temp___do_typ_inv_207 Bool)) Bool (=>
                                     (or (= temp___is_init_204 true)
                                     (<= 0 2)) (in_range4 temp___expr_208)))

;; size__post_axiom
  (assert
  (forall ((f us_rep1)) (! (in_range1 (size f)) :pattern ((size f)) )))

;; index__post_axiom
  (assert
  (forall ((f us_rep1)) (! (in_range1 (index f)) :pattern ((index f)) )))

(assert
;; defqtvc
 ;; File "lexer.adb", line 234, characters 0-0
  (not
  (forall ((current_read__split_fields character)
  (current_read__split_discrs read_status)
  (next_read__split_fields character) (next_read__split_discrs read_status)
  (current_idx Int) (the_file us_rep1) (next_idx Int) (current_line Int)
  (current_col Int) (current_idx1 Int) (next_idx1 Int)
  (next_read__split_fields1 character) (next_read__split_discrs1 read_status)
  (current_read__split_fields1 character)
  (current_read__split_discrs1 read_status)
  (next_read__split_fields2 character) (next_read__split_discrs2 read_status)
  (current_idx2 Int) (the_file1 us_rep1) (next_idx2 Int) (current_line1 Int)
  (current_col1 Int) (o Bool) (temp___loop_entry_666 Int))
  (=> (= current_read__attr__constrained false)
  (=> (dynamic_invariant1 current_line true false true true)
  (=> (dynamic_invariant current_col true false true true)
  (=> (dynamic_invariant current_idx true false true true)
  (=> (= next_read__attr__constrained false)
  (=> (dynamic_invariant next_idx true false true true)
  (=>
  (forall ((current_read__split_fields2 character)
  (current_read__split_discrs2 read_status)
  (next_read__split_fields3 character) (next_read__split_discrs3 read_status)
  (current_idx3 Int) (the_file2 us_rep1) (next_idx3 Int))
  (local_invariant__function_guard
  (local_invariant the_file2 next_idx3
  (us_split_fieldsqtmk current_read__split_fields2)
  (us_split_discrsqtmk current_read__split_discrs2) current_idx3
  (us_split_fieldsqtmk next_read__split_fields3)
  (us_split_discrsqtmk next_read__split_discrs3)) the_file2 next_idx3
  (us_split_fieldsqtmk current_read__split_fields2)
  (us_split_discrsqtmk current_read__split_discrs2) current_idx3
  (us_split_fieldsqtmk next_read__split_fields3)
  (us_split_discrsqtmk next_read__split_discrs3)))
  (=>
  (= (local_invariant the_file next_idx
     (us_split_fieldsqtmk current_read__split_fields)
     (us_split_discrsqtmk current_read__split_discrs) current_idx
     (us_split_fieldsqtmk next_read__split_fields)
     (us_split_discrsqtmk next_read__split_discrs)) true)
  (=> (= next_read__split_fields1 next_read__split_fields)
  (=> (= next_read__split_discrs1 next_read__split_discrs)
  (=> (= next_idx1 next_idx)
  (=> (= current_idx1 current_idx)
  (=> (= (to_rep1 current_read__split_discrs) 0)
  (=> (= (to_rep current_read__split_fields) 59)
  (=> (= current_idx2 next_idx1)
  (=>
  (forall ((current_read__split_fields2 character)
  (current_read__split_discrs2 read_status)
  (next_read__split_fields3 character) (next_read__split_discrs3 read_status)
  (current_idx3 Int) (the_file2 us_rep1) (next_idx3 Int))
  (local_invariant__function_guard
  (local_invariant the_file2 next_idx3
  (us_split_fieldsqtmk current_read__split_fields2)
  (us_split_discrsqtmk current_read__split_discrs2) current_idx3
  (us_split_fieldsqtmk next_read__split_fields3)
  (us_split_discrsqtmk next_read__split_discrs3)) the_file2 next_idx3
  (us_split_fieldsqtmk current_read__split_fields2)
  (us_split_discrsqtmk current_read__split_discrs2) current_idx3
  (us_split_fieldsqtmk next_read__split_fields3)
  (us_split_discrsqtmk next_read__split_discrs3)))
  (=>
  (= (local_invariant the_file1 next_idx2
     (us_split_fieldsqtmk current_read__split_fields1)
     (us_split_discrsqtmk current_read__split_discrs1) current_idx2
     (us_split_fieldsqtmk next_read__split_fields2)
     (us_split_discrsqtmk next_read__split_discrs2)) true)
  (=>
  (= (bool_eq
     (us_repqtmk (us_split_discrsqtmk current_read__split_discrs1)
     (us_split_fieldsqtmk current_read__split_fields1))
     (us_repqtmk (us_split_discrsqtmk next_read__split_discrs1)
     (us_split_fieldsqtmk next_read__split_fields1))) true)
  (=> (<= current_idx1 current_idx2)
  (=> (dynamic_invariant next_idx2 true true true true)
  (=> (dynamic_invariant1 current_line1 true true true true)
  (=> (dynamic_invariant current_col1 true true true true)
  (=> (dynamic_invariant current_idx2 true true true true)
  (=>
  (exists ((o1 Int))
  (and (= (to_rep1 current_read__split_discrs1) o1)
  (ite (= o1 0)
  (exists ((o2 Int))
  (and (= (to_rep current_read__split_fields1) o2)
  (= o (ite (= o2 10) false true)))) (= o false))))
  (=> (= o true)
  (=> (= temp___loop_entry_666 current_idx2)
  (let ((o1 (local_invariant the_file1 next_idx2
            (us_split_fieldsqtmk current_read__split_fields1)
            (us_split_discrsqtmk current_read__split_discrs1) current_idx2
            (us_split_fieldsqtmk next_read__split_fields2)
            (us_split_discrsqtmk next_read__split_discrs2))))
  (=>
  (forall ((the_file2 us_rep1)) (size__function_guard (size the_file2)
  the_file2))
  (=>
  (forall ((the_file2 us_rep1)) (size__function_guard (size the_file2)
  the_file2))
  (=>
  (forall ((the_file2 us_rep1)) (index__function_guard (index the_file2)
  the_file2))
  (=>
  (and (local_invariant__function_guard o1 the_file1 next_idx2
  (us_split_fieldsqtmk current_read__split_fields1)
  (us_split_discrsqtmk current_read__split_discrs1) current_idx2
  (us_split_fieldsqtmk next_read__split_fields2)
  (us_split_discrsqtmk next_read__split_discrs2))
  (= (= o1 true)
  (and
  (and
  (and
  (and
  (and
  (and (not (= current_read__attr__constrained true))
  (not (= next_read__attr__constrained true)))
  (<= current_idx2 (size the_file1))) (<= next_idx2 (size the_file1)))
  (= next_idx2 (index the_file1))) (<= current_idx2 next_idx2))
  (ite (= (to_rep1 next_read__split_discrs2) 0)
  (and (= (to_rep1 current_read__split_discrs1) 0)
  (= current_idx2 (- next_idx2 1))) (= current_idx2 next_idx2)))))
  (forall ((current_read__split_fields2 character)
  (current_read__split_discrs2 read_status)
  (next_read__split_fields3 character) (next_read__split_discrs3 read_status)
  (current_idx3 Int) (the_file2 us_rep1) (next_idx3 Int) (current_line2 Int)
  (current_col2 Int))
  (=>
  (forall ((current_read__split_fields3 character)
  (current_read__split_discrs3 read_status)
  (next_read__split_fields4 character) (next_read__split_discrs4 read_status)
  (current_idx4 Int) (the_file3 us_rep1) (next_idx4 Int))
  (local_invariant__function_guard
  (local_invariant the_file3 next_idx4
  (us_split_fieldsqtmk current_read__split_fields3)
  (us_split_discrsqtmk current_read__split_discrs3) current_idx4
  (us_split_fieldsqtmk next_read__split_fields4)
  (us_split_discrsqtmk next_read__split_discrs4)) the_file3 next_idx4
  (us_split_fieldsqtmk current_read__split_fields3)
  (us_split_discrsqtmk current_read__split_discrs3) current_idx4
  (us_split_fieldsqtmk next_read__split_fields4)
  (us_split_discrsqtmk next_read__split_discrs4)))
  (=>
  (and
  (= (local_invariant the_file2 next_idx3
     (us_split_fieldsqtmk current_read__split_fields2)
     (us_split_discrsqtmk current_read__split_discrs2) current_idx3
     (us_split_fieldsqtmk next_read__split_fields3)
     (us_split_discrsqtmk next_read__split_discrs3)) true)
  (<= temp___loop_entry_666 current_idx3))
  (=>
  (= (and (ite (and
               (and
               (and (dynamic_invariant next_idx3 true true true true)
               (dynamic_invariant1 current_line2 true true true true))
               (dynamic_invariant current_col2 true true true true))
               (dynamic_invariant current_idx3 true true true true))
          true false) (ite (and (= (to_rep1 current_read__split_discrs2) 0)
                           (not (= (to_rep current_read__split_fields2) 10)))
                      true false)) true)
  (forall ((temp___669 Int))
  (=> (= temp___669 next_idx3)
  (forall ((o2 Int))
  (=> (= (to_rep1 next_read__split_discrs3) o2)
  (forall ((temp___668 Int))
  (=> (= temp___668 (ite (ite (= o2 0) true false) 1 0))
  (forall ((current_idx4 Int))
  (=> (= current_idx4 current_idx3)
  (forall ((next_idx4 Int))
  (=> (= next_idx4 next_idx3)
  (forall ((next_read__split_fields4 character))
  (=> (= next_read__split_fields4 next_read__split_fields3)
  (forall ((next_read__split_discrs4 read_status))
  (=> (= next_read__split_discrs4 next_read__split_discrs3)
  (forall ((current_read__split_fields3 character)
  (current_read__split_discrs3 read_status)
  (next_read__split_fields5 character) (next_read__split_discrs5 read_status)
  (current_idx5 Int) (the_file3 us_rep1) (next_idx5 Int) (current_line3 Int)
  (current_col3 Int))
  (=>
  (forall ((current_read__split_fields4 character)
  (current_read__split_discrs4 read_status)
  (next_read__split_fields6 character) (next_read__split_discrs6 read_status)
  (current_idx6 Int) (the_file4 us_rep1) (next_idx6 Int))
  (local_invariant__function_guard
  (local_invariant the_file4 next_idx6
  (us_split_fieldsqtmk current_read__split_fields4)
  (us_split_discrsqtmk current_read__split_discrs4) current_idx6
  (us_split_fieldsqtmk next_read__split_fields6)
  (us_split_discrsqtmk next_read__split_discrs6)) the_file4 next_idx6
  (us_split_fieldsqtmk current_read__split_fields4)
  (us_split_discrsqtmk current_read__split_discrs4) current_idx6
  (us_split_fieldsqtmk next_read__split_fields6)
  (us_split_discrsqtmk next_read__split_discrs6)))
  (=>
  (and
  (and
  (and
  (and
  (= (local_invariant the_file3 next_idx5
     (us_split_fieldsqtmk current_read__split_fields3)
     (us_split_discrsqtmk current_read__split_discrs3) current_idx5
     (us_split_fieldsqtmk next_read__split_fields5)
     (us_split_discrsqtmk next_read__split_discrs5)) true)
  (= (bool_eq
     (us_repqtmk (us_split_discrsqtmk current_read__split_discrs3)
     (us_split_fieldsqtmk current_read__split_fields3))
     (us_repqtmk (us_split_discrsqtmk next_read__split_discrs4)
     (us_split_fieldsqtmk next_read__split_fields4))) true))
  (= current_idx5 next_idx4)) (<= current_idx4 current_idx5))
  (and
  (and
  (and (dynamic_invariant next_idx5 true true true true) (dynamic_invariant1
  current_line3 true true true true)) (dynamic_invariant current_col3 true
  true true true)) (dynamic_invariant current_idx5 true true true true)))
  (forall ((o3 Bool))
  (=>
  (exists ((o4 Int))
  (and (= (to_rep1 current_read__split_discrs3) o4)
  (ite (= o4 0)
  (exists ((o5 Int))
  (and (= (to_rep current_read__split_fields3) o5)
  (= o3 (ite (= o5 10) false true)))) (= o3 false))))
  (=> (= o3 true)
  (or (< temp___669 next_idx5)
  (and (= next_idx5 temp___669)
  (< (ite (= (to_rep1 next_read__split_discrs5) 0) 1 0) temp___668)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)