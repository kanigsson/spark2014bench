(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
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

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
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

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort character 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (character character) Bool)

(declare-const dummy3 character)

(declare-datatypes ()
((character__ref (character__refqtmk (character__content character)))))
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

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int character))))))
(declare-fun slide ((Array Int character) Int Int) (Array Int character))

;; slide_eq
  (assert
  (forall ((a (Array Int character)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int character)) (a__first Int) (a__last Int)
  (b (Array Int character)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_91 Int))
                           (=>
                           (and (<= a__first temp___idx_91)
                           (<= temp___idx_91 a__last))
                           (= (to_rep (select a temp___idx_91)) (to_rep
                                                                (select b (+ (- b__first a__first) temp___idx_91)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_91 Int))
  (=> (and (<= a__first temp___idx_91) (<= temp___idx_91 a__last))
  (= (to_rep (select a temp___idx_91)) (to_rep
                                       (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range3 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range3 f)
     (=> (in_range3 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range3 low)
                   (and (in_range3 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int character))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int character) (elts a))

(define-fun of_array ((a (Array Int character)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

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

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ()
((string____ref (string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(define-fun dynamic_invariant2 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(declare-fun invariant__ (us_private) Bool)

(declare-fun invariant____function_guard (Bool us_private) Bool)

;; invariant____post_axiom
  (assert true)

(declare-sort read_status 0)

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (read_status read_status) Bool)

(declare-const dummy5 read_status)

(declare-datatypes ()
((read_status__ref (read_status__refqtmk (read_status__content read_status)))))
(define-fun read_status__ref_read_status__content__projection ((a read_status__ref)) read_status 
  (read_status__content a))

(declare-fun to_rep2 (read_status) Int)

(declare-fun of_rep2 (Int) read_status)

;; inversion_axiom
  (assert
  (forall ((x read_status))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x read_status)) (! (in_range5
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range5 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__file_io__read_result__status read_status)))))
(define-fun us_split_discrs_rec__file_io__read_result__status__projection ((a us_split_discrs)) read_status 
  (rec__file_io__read_result__status a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk (rec__file_io__read_result__c character)))))
(define-fun us_split_fields_rec__file_io__read_result__c__projection ((a us_split_fields)) character 
  (rec__file_io__read_result__c a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun file_io__read_result__c__pred ((a us_rep)) Bool (= (to_rep2
                                                               (rec__file_io__read_result__status
                                                               (us_split_discrs1
                                                               a))) 0))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep2
                           (rec__file_io__read_result__status
                           (us_split_discrs1 a))) (to_rep2
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
  (a us_split_discrs)) Bool (= rec__file_io__read_result__status1 (to_rep2
                                                                  (rec__file_io__read_result__status
                                                                  a))))

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

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ()
((read_result__ref (read_result__refqtmk (read_result__content us_rep)))))
(define-fun read_result__ref_read_result__content__projection ((a read_result__ref)) us_rep 
  (read_result__content a))

(declare-const current_read__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun default_initial_assumption ((temp___expr_215 us_rep)
  (temp___skip_top_level_216 Bool)) Bool (= (to_rep2
                                            (rec__file_io__read_result__status
                                            (us_split_discrs1
                                            temp___expr_215))) 2))

(declare-const next_read__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun invariant__1 (us_split_fields us_split_discrs us_private
  us_split_fields us_split_discrs) Bool)

(declare-fun invariant____function_guard1 (Bool us_split_fields
  us_split_discrs us_private us_split_fields us_split_discrs) Bool)

(declare-fun local_invariant (us_split_fields us_split_discrs us_split_fields
  us_split_discrs) Bool)

(declare-fun local_invariant__function_guard (Bool us_split_fields
  us_split_discrs us_split_fields us_split_discrs) Bool)

;; invariant____post_axiom
  (assert true)

;; invariant____def_axiom
  (assert
  (forall ((lexer__current_read__fields us_split_fields)
  (lexer__next_read__fields us_split_fields))
  (forall ((lexer__current_read__discrs us_split_discrs)
  (lexer__next_read__discrs us_split_discrs))
  (forall ((names__name_table us_private))
  (! (and
     (forall ((names__name_table1 us_private)) (invariant____function_guard
     (invariant__ names__name_table1) names__name_table1))
     (and
     (forall ((lexer__current_read__fields1 us_split_fields)
     (lexer__next_read__fields1 us_split_fields)
     (lexer__current_read__discrs1 us_split_discrs)
     (lexer__next_read__discrs1 us_split_discrs))
     (local_invariant__function_guard
     (local_invariant lexer__current_read__fields1
     lexer__current_read__discrs1 lexer__next_read__fields1
     lexer__next_read__discrs1) lexer__current_read__fields1
     lexer__current_read__discrs1 lexer__next_read__fields1
     lexer__next_read__discrs1))
     (=
     (= (invariant__1 lexer__current_read__fields lexer__current_read__discrs
        names__name_table lexer__next_read__fields lexer__next_read__discrs) true)
     (and (= (invariant__ names__name_table) true)
     (= (local_invariant lexer__current_read__fields
        lexer__current_read__discrs lexer__next_read__fields
        lexer__next_read__discrs) true))))) :pattern ((invariant__1
                                                      lexer__current_read__fields
                                                      lexer__current_read__discrs
                                                      names__name_table
                                                      lexer__next_read__fields
                                                      lexer__next_read__discrs)) )))))

(declare-const filename us_t)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-sort us_rep1 0)

(declare-fun bool_eq3 (us_rep1 us_rep1) Bool)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq7 (us_rep1 us_rep1) Bool)

(declare-const dummy7 us_rep1)

(declare-datatypes () ((file__ref (file__refqtmk (file__content us_rep1)))))
(define-fun file__ref_file__content__projection ((a file__ref)) us_rep1 
  (file__content a))

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-sort name_id 0)

(declare-fun name_idqtint (name_id) Int)

;; name_id'axiom
  (assert
  (forall ((i name_id))
  (and (<= 0 (name_idqtint i)) (<= (name_idqtint i) 2147483647))))

(define-fun in_range7 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq8 (name_id name_id) Bool)

(declare-const dummy8 name_id)

(declare-datatypes ()
((name_id__ref (name_id__refqtmk (name_id__content name_id)))))
(define-fun name_id__ref_name_id__content__projection ((a name_id__ref)) name_id 
  (name_id__content a))

(define-fun dynamic_invariant3 ((temp___expr_186 Int)
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (=>
                                     (or (= temp___is_init_182 true)
                                     (<= 0 2147483647)) (in_range7
                                     temp___expr_186)))

(define-fun dynamic_invariant4 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range4 temp___expr_74)))

(define-fun dynamic_invariant5 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range3 temp___expr_18)))

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

(define-fun dynamic_invariant6 ((temp___expr_206 Int)
  (temp___is_init_202 Bool) (temp___skip_constant_203 Bool)
  (temp___do_toplevel_204 Bool)
  (temp___do_typ_inv_205 Bool)) Bool (=>
                                     (or (= temp___is_init_202 true)
                                     (<= 0 2)) (in_range5 temp___expr_206)))

(declare-const name_table us_private)

(declare-const current_read__split_fields character)

(declare-const current_read__split_discrs read_status)

(declare-const next_read__split_fields character)

(declare-const next_read__split_discrs read_status)

(declare-const the_filename Int)

(declare-const the_file us_rep1)

(declare-const current_line Int)

(declare-const current_col Int)

(declare-const current_pos Int)

;; Assume
  (assert (dynamic_invariant3 the_filename false false true true))

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert (= current_read__attr__constrained false))

;; Assume
  (assert (dynamic_invariant1 current_line false false true true))

;; Assume
  (assert (dynamic_invariant current_col false false true true))

;; Assume
  (assert (dynamic_invariant current_pos false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (= next_read__attr__constrained false))

;; Assume
  (assert (dynamic_invariant2 filename true false true true))

;; H
  (assert
  (forall ((name_table1 us_private)) (invariant____function_guard
  (invariant__ name_table1) name_table1)))

;; Assume
  (assert (= (invariant__ name_table) true))

;; Assume
  (assert
  (and (not (= current_read__attr__constrained true))
  (not (= next_read__attr__constrained true))))

(declare-const name_table1 us_private)

(declare-const the_filename1 Int)

;; H
  (assert
  (forall ((name_table2 us_private)) (invariant____function_guard
  (invariant__ name_table2) name_table2)))

;; H
  (assert (= (invariant__ name_table1) true))

;; H
  (assert (dynamic_invariant3 the_filename1 true true true true))

(declare-const the_file1 us_rep1)

;; Ensures
  (assert true)

(declare-const current_line1 Int)

;; H
  (assert (= current_line1 1))

(declare-const current_col1 Int)

;; H
  (assert (= current_col1 0))

(declare-const current_pos1 Int)

;; H
  (assert (= current_pos1 0))

(assert
;; defqtvc
 ;; File "lexer.ads", line 72, characters 0-0
  (not (not (= current_read__attr__constrained true))))
(check-sat)

(exit)
