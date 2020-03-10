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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

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
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(declare-sort character 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (character character) Bool)

(declare-const dummy3 character)

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
  (forall ((x character)) (! (in_range4 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort read_status 0)

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq4 (read_status read_status) Bool)

(declare-const dummy4 read_status)

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
  (forall ((x read_status)) (! (in_range5
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range5 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
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

(define-fun in_range6 ((rec__file_io__read_result__status1 Int)
  (a us_split_discrs)) Bool (= rec__file_io__read_result__status1 (to_rep1
                                                                  (rec__file_io__read_result__status
                                                                  a))))

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

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((read_result__ref 0))
(((read_result__refqtmk (read_result__content us_rep)))))
(define-fun read_result__ref_read_result__content__projection ((a read_result__ref)) us_rep 
  (read_result__content a))

(declare-const current_read__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption ((temp___expr_215 us_rep)
  (temp___skip_top_level_216 Bool)) Bool (= (to_rep1
                                            (rec__file_io__read_result__status
                                            (us_split_discrs1
                                            temp___expr_215))) 2))

(declare-const next_read__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun local_invariant (us_split_fields us_split_discrs us_split_fields
  us_split_discrs) Bool)

(declare-fun local_invariant__function_guard (Bool us_split_fields
  us_split_discrs us_split_fields us_split_discrs) Bool)

;; local_invariant__post_axiom
  (assert true)

;; local_invariant__def_axiom
  (assert
  (forall ((lexer__current_read__fields us_split_fields)
  (lexer__next_read__fields us_split_fields))
  (forall ((lexer__current_read__discrs us_split_discrs)
  (lexer__next_read__discrs us_split_discrs))
  (! (=
     (= (local_invariant lexer__current_read__fields
        lexer__current_read__discrs lexer__next_read__fields
        lexer__next_read__discrs) true)
     (and (not (= current_read__attr__constrained true))
     (not (= next_read__attr__constrained true)))) :pattern ((local_invariant
                                                             lexer__current_read__fields
                                                             lexer__current_read__discrs
                                                             lexer__next_read__fields
                                                             lexer__next_read__discrs)) ))))

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

(declare-fun user_eq6 (us_rep1 us_rep1) Bool)

(declare-const dummy6 us_rep1)

(declare-datatypes ((file__ref 0))
(((file__refqtmk (file__content us_rep1)))))
(define-fun file__ref_file__content__projection ((a file__ref)) us_rep1 
  (file__content a))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-sort capacity_range 0)

(declare-fun capacity_rangeqtint (capacity_range) Int)

;; capacity_range'axiom
  (assert
  (forall ((i capacity_range))
  (and (<= 0 (capacity_rangeqtint i))
  (<= (capacity_rangeqtint i) 2147483647))))

(define-fun in_range7 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq7 (capacity_range capacity_range) Bool)

(declare-const dummy7 capacity_range)

(declare-datatypes ((capacity_range__ref 0))
(((capacity_range__refqtmk (capacity_range__content capacity_range)))))
(define-fun capacity_range__ref_capacity_range__content__projection ((a capacity_range__ref)) capacity_range 
  (capacity_range__content a))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-datatypes ((us_split_discrs2 0))
(((us_split_discrsqtmk1
  (rec__unbounded_strings__char_vectors__vector__capacity capacity_range)))))
(define-fun us_split_discrs_rec__unbounded_strings__char_vectors__vector__capacity__projection ((a us_split_discrs2)) capacity_range 
  (rec__unbounded_strings__char_vectors__vector__capacity a))

(declare-datatypes ((us_split_discrs__ref1 0))
(((us_split_discrs__refqtmk1 (us_split_discrs__content1 us_split_discrs2)))))
(define-fun us_split_discrs__ref___split_discrs__content__3__projection ((a us_split_discrs__ref1)) us_split_discrs2 
  (us_split_discrs__content1 a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__unbounded_strings__char_vectors__vector us_main_type1)))))
(define-fun us_split_fields_rec__unbounded_strings__char_vectors__vector__projection ((a us_split_fields2)) us_main_type1 
  (rec__unbounded_strings__char_vectors__vector a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk1
  (us_split_discrs3 us_split_discrs2)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__3__projection ((a us_rep2)) us_split_discrs2 
  (us_split_discrs3 a))

(define-fun us_rep___split_fields__3__projection ((a us_rep2)) us_split_fields2 
  (us_split_fields3 a))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const unbounded_strings__char_vectors__vector__capacity__first__bit Int)

(declare-const unbounded_strings__char_vectors__vector__capacity__last__bit Int)

(declare-const unbounded_strings__char_vectors__vector__capacity__position Int)

;; unbounded_strings__char_vectors__vector__capacity__first__bit_axiom
  (assert
  (<= 0 unbounded_strings__char_vectors__vector__capacity__first__bit))

;; unbounded_strings__char_vectors__vector__capacity__last__bit_axiom
  (assert
  (< unbounded_strings__char_vectors__vector__capacity__first__bit unbounded_strings__char_vectors__vector__capacity__last__bit))

;; unbounded_strings__char_vectors__vector__capacity__position_axiom
  (assert (<= 0 unbounded_strings__char_vectors__vector__capacity__position))

(declare-fun user_eq8 (us_rep2 us_rep2) Bool)

(declare-const dummy8 us_rep2)

(declare-datatypes ((unbounded_string__ref 0))
(((unbounded_string__refqtmk (unbounded_string__content us_rep2)))))
(define-fun unbounded_string__ref_unbounded_string__content__projection ((a unbounded_string__ref)) us_rep2 
  (unbounded_string__content a))

(define-fun to_rep2 ((x capacity_range)) Int (capacity_rangeqtint x))

(declare-fun of_rep2 (Int) capacity_range)

;; inversion_axiom
  (assert
  (forall ((x capacity_range))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x capacity_range)) (! (in_range7
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range7 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(define-fun in_range8 ((rec__unbounded_strings__char_vectors__vector__capacity1 Int)
  (a us_split_discrs2)) Bool (= rec__unbounded_strings__char_vectors__vector__capacity1 
  (to_rep2 (rec__unbounded_strings__char_vectors__vector__capacity a))))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const unbounded_strings__char_vectors__vector__capacity__first__bit1 Int)

(declare-const unbounded_strings__char_vectors__vector__capacity__last__bit1 Int)

(declare-const unbounded_strings__char_vectors__vector__capacity__position1 Int)

;; unbounded_strings__char_vectors__vector__capacity__first__bit_axiom
  (assert
  (<= 0 unbounded_strings__char_vectors__vector__capacity__first__bit1))

;; unbounded_strings__char_vectors__vector__capacity__last__bit_axiom
  (assert
  (< unbounded_strings__char_vectors__vector__capacity__first__bit1 unbounded_strings__char_vectors__vector__capacity__last__bit1))

;; unbounded_strings__char_vectors__vector__capacity__position_axiom
  (assert
  (<= 0 unbounded_strings__char_vectors__vector__capacity__position1))

(declare-fun user_eq9 (us_rep2 us_rep2) Bool)

(declare-const dummy9 us_rep2)

(declare-datatypes ((vector__ref 0))
(((vector__refqtmk (vector__content us_rep2)))))
(define-fun vector__ref_vector__content__projection ((a vector__ref)) us_rep2 
  (vector__content a))

(declare-const s__split_discrs us_split_discrs2)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-fun length (us_rep2) Int)

(declare-fun length__function_guard (Int us_rep2) Bool)

(define-fun dynamic_invariant2 ((temp___expr_300 us_rep2)
  (temp___is_init_296 Bool) (temp___skip_constant_297 Bool)
  (temp___do_toplevel_298 Bool)
  (temp___do_typ_inv_299 Bool)) Bool (=>
                                     (not (= temp___skip_constant_297 true))
                                     (in_range8 32
                                     (us_split_discrs3 temp___expr_300))))

;; temp___result_306'def
  (assert
  (forall ((temp___305 us_rep2)) (length__function_guard (length temp___305)
  temp___305)))

(define-fun default_initial_assumption1 ((temp___expr_302 us_rep2)
  (temp___skip_top_level_303 Bool)) Bool (and
                                         (= (to_rep2
                                            (rec__unbounded_strings__char_vectors__vector__capacity
                                            (us_split_discrs3
                                            temp___expr_302))) 32)
                                         (=>
                                         (not
                                         (= temp___skip_top_level_303 true))
                                         (= (length temp___expr_302) 0))))

;; length__post_axiom
  (assert
  (forall ((s us_rep2))
  (! (=> (dynamic_invariant2 s true true true true)
     (let ((result (length s)))
     (=> (length__function_guard result s) (dynamic_invariant result true
     false true true)))) :pattern ((length s)) )))

(define-fun dynamic_invariant3 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range4 temp___expr_74)))

(define-fun dynamic_invariant4 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant5 ((temp___expr_206 Int)
  (temp___is_init_202 Bool) (temp___skip_constant_203 Bool)
  (temp___do_toplevel_204 Bool)
  (temp___do_typ_inv_205 Bool)) Bool (=>
                                     (or (= temp___is_init_202 true)
                                     (<= 0 2)) (in_range5 temp___expr_206)))

(define-fun dynamic_invariant6 ((temp___expr_287 Int)
  (temp___is_init_283 Bool) (temp___skip_constant_284 Bool)
  (temp___do_toplevel_285 Bool)
  (temp___do_typ_inv_286 Bool)) Bool (=>
                                     (or (= temp___is_init_283 true)
                                     (<= 0 2147483647)) (in_range7
                                     temp___expr_287)))

(assert
;; defqtvc
 ;; File "lexer.adb", line 153, characters 0-0
  (not
  (forall ((current_read__split_fields character)
  (current_read__split_discrs read_status)
  (next_read__split_fields character) (next_read__split_discrs read_status)
  (current_line Int) (current_col Int) (current_pos Int)
  (s__split_fields us_main_type1))
  (=> (= current_read__attr__constrained false)
  (=> (dynamic_invariant1 current_line true false true true)
  (=> (dynamic_invariant current_col true false true true)
  (=> (dynamic_invariant current_pos true false true true)
  (=> (= next_read__attr__constrained false)
  (=> (dynamic_invariant2
  (us_repqtmk1 s__split_discrs (us_split_fieldsqtmk1 s__split_fields)) true
  false true true)
  (=>
  (forall ((current_read__split_fields1 character)
  (current_read__split_discrs1 read_status)
  (next_read__split_fields1 character)
  (next_read__split_discrs1 read_status)) (local_invariant__function_guard
  (local_invariant (us_split_fieldsqtmk current_read__split_fields1)
  (us_split_discrsqtmk current_read__split_discrs1)
  (us_split_fieldsqtmk next_read__split_fields1)
  (us_split_discrsqtmk next_read__split_discrs1))
  (us_split_fieldsqtmk current_read__split_fields1)
  (us_split_discrsqtmk current_read__split_discrs1)
  (us_split_fieldsqtmk next_read__split_fields1)
  (us_split_discrsqtmk next_read__split_discrs1)))
  (=>
  (= (local_invariant (us_split_fieldsqtmk current_read__split_fields)
     (us_split_discrsqtmk current_read__split_discrs)
     (us_split_fieldsqtmk next_read__split_fields)
     (us_split_discrsqtmk next_read__split_discrs)) true)
  (=> (= (to_rep1 current_read__split_discrs) 0)
  (=> (exists ((o Int)) (= (to_rep current_read__split_fields) o))
  (let ((o s__split_discrs))
  (forall ((s__split_fields1 us_main_type1))
  (=>
  (forall ((o1 us_split_discrs2) (s__split_fields2 us_main_type1))
  (length__function_guard
  (length (us_repqtmk1 o1 (us_split_fieldsqtmk1 s__split_fields2)))
  (us_repqtmk1 o1 (us_split_fieldsqtmk1 s__split_fields2))))
  (=>
  (forall ((s__split_fields2 us_main_type1) (o1 us_split_discrs2))
  (length__function_guard
  (length (us_repqtmk1 o1 (us_split_fieldsqtmk1 s__split_fields2)))
  (us_repqtmk1 o1 (us_split_fieldsqtmk1 s__split_fields2))))
  (=>
  (and
  (= (length (us_repqtmk1 o (us_split_fieldsqtmk1 s__split_fields1))) (+ 
  (length (us_repqtmk1 o (us_split_fieldsqtmk1 s__split_fields))) 1))
  (dynamic_invariant2 (us_repqtmk1 o (us_split_fieldsqtmk1 s__split_fields1))
  true true true true))
  (forall ((current_pos1 Int))
  (=> (= current_pos1 current_pos)
  (forall ((next_read__split_fields1 character))
  (=> (= next_read__split_fields1 next_read__split_fields)
  (forall ((next_read__split_discrs1 read_status))
  (=> (= next_read__split_discrs1 next_read__split_discrs)
  (forall ((current_read__split_fields1 character)
  (current_read__split_discrs1 read_status)
  (next_read__split_fields2 character) (next_read__split_discrs2 read_status)
  (current_line1 Int) (current_col1 Int) (current_pos2 Int))
  (=>
  (forall ((current_read__split_fields2 character)
  (current_read__split_discrs2 read_status)
  (next_read__split_fields3 character)
  (next_read__split_discrs3 read_status)) (local_invariant__function_guard
  (local_invariant (us_split_fieldsqtmk current_read__split_fields2)
  (us_split_discrsqtmk current_read__split_discrs2)
  (us_split_fieldsqtmk next_read__split_fields3)
  (us_split_discrsqtmk next_read__split_discrs3))
  (us_split_fieldsqtmk current_read__split_fields2)
  (us_split_discrsqtmk current_read__split_discrs2)
  (us_split_fieldsqtmk next_read__split_fields3)
  (us_split_discrsqtmk next_read__split_discrs3)))
  (=>
  (and
  (and
  (and
  (= (local_invariant (us_split_fieldsqtmk current_read__split_fields1)
     (us_split_discrsqtmk current_read__split_discrs1)
     (us_split_fieldsqtmk next_read__split_fields2)
     (us_split_discrsqtmk next_read__split_discrs2)) true)
  (= (bool_eq
     (us_repqtmk (us_split_discrsqtmk current_read__split_discrs1)
     (us_split_fieldsqtmk current_read__split_fields1))
     (us_repqtmk (us_split_discrsqtmk next_read__split_discrs1)
     (us_split_fieldsqtmk next_read__split_fields1))) true))
  (<= current_pos1 current_pos2))
  (and
  (and (dynamic_invariant1 current_line1 true true true true)
  (dynamic_invariant current_col1 true true true true)) (dynamic_invariant
  current_pos2 true true true true)))
  (=>
  (forall ((current_read__split_fields2 character)
  (current_read__split_discrs2 read_status)
  (next_read__split_fields3 character)
  (next_read__split_discrs3 read_status)) (local_invariant__function_guard
  (local_invariant (us_split_fieldsqtmk current_read__split_fields2)
  (us_split_discrsqtmk current_read__split_discrs2)
  (us_split_fieldsqtmk next_read__split_fields3)
  (us_split_discrsqtmk next_read__split_discrs3))
  (us_split_fieldsqtmk current_read__split_fields2)
  (us_split_discrsqtmk current_read__split_discrs2)
  (us_split_fieldsqtmk next_read__split_fields3)
  (us_split_discrsqtmk next_read__split_discrs3)))
  (= (local_invariant (us_split_fieldsqtmk current_read__split_fields1)
     (us_split_discrsqtmk current_read__split_discrs1)
     (us_split_fieldsqtmk next_read__split_fields2)
     (us_split_discrsqtmk next_read__split_discrs2)) true)))))))))))))))))))))))))))))
(check-sat)
(exit)
